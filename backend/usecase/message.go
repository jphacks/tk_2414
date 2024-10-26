package usecase

import (
	"context"
	"fairedu/dao"
	"fairedu/model"
	"fairedu/util"
	"fmt"
	"time"

	"github.com/google/uuid"
)

type MessageUsecase interface {
	ProcessMessage(ctx context.Context, m model.Message, lecture_id string, user_id string) (*model.Conversation, error)
	GetMessagesByChatID(ctx context.Context, chat_id string) ([]*model.Message, error)
	GetChatsByUserIDAndLectureID(ctx context.Context, user_id string, lecture_id string) ([]*model.SegmentedChat, error)
}

type messageUsecase struct {
	dao_m dao.MessageDao
	dao_s dao.SegmentsDao
}

func NewMessageUsecase(d_m dao.MessageDao, d_s dao.SegmentsDao) *messageUsecase {
	return &messageUsecase{
		dao_m: d_m,
		dao_s: d_s,
	}
}

func (u *messageUsecase) ProcessMessage(ctx context.Context, m model.Message, lecture_id string, user_id string) (*model.Conversation, error) {
	//todo: 分ける
	if m.ChatID == "" {
		m.ChatID = uuid.New().String()
		tags, err := u.dao_s.GetSegmentTagsByLectureID(ctx, lecture_id)
		if err != nil {
			return nil, err
		}
		prompt := fmt.Sprintf("以下に「idと[]tagの配列からなるタグの配列」と、「生徒からの質問」を示します。生徒からの質問に最も関連があるタグを必ず1つだけ選び、idを返してください。\n質問: %s\nタグ: %v\n出力はidのみを返してください。", m.Message, tags)
		response, err := util.GetOpenAIChatResponse(ctx, prompt)
		if err != nil {
			return nil, err
		}
		_, err = u.dao_m.CreateChat(ctx, model.Chat{
			ID: m.ChatID,
			UserID: user_id,
			SegmentID: response,
			CreatedAt: time.Now(),
		})
		if err != nil {
			return nil, err
		}
	}
	m.ID = uuid.New().String()
	m.IsUser = true
	user_message, err := u.dao_m.SendMessage(ctx, m)
	if err != nil {
		return nil, err
	}

	prompt := fmt.Sprintf("あなたは親しみやすく、理解しやすい説明を得意とする数学の先生です。これから生徒からの質問を伝えるので、生徒が理解しやすいように簡潔に日本語で説明してください \n 質問: %s", user_message.Message)
	response, err := util.GetOpenAIChatResponse(ctx, prompt)
	if err != nil {
		return nil, err
	}

	m_bot := model.Message{
		ID: uuid.New().String(),
		IsUser: false,
		ChatID: user_message.ChatID,
		Message: response,
		CreatedAt: user_message.CreatedAt,
	}
	bot_message, err := u.dao_m.SendMessage(ctx, m_bot)
	if err != nil {
		return nil, err
	}
	return &model.Conversation{
		UserMessage: user_message,
		BotMessage: bot_message,
	}, nil
}

func (u *messageUsecase) GetMessagesByChatID(ctx context.Context, chat_id string) ([]*model.Message, error) {
	messages, err := u.dao_m.GetMessageByChatID(ctx, chat_id)
	if err != nil {
		return nil, err
	}
	return messages, nil
}

func (u *messageUsecase) GetChatsByUserIDAndLectureID(ctx context.Context, user_id string, lecture_id string) ([]*model.SegmentedChat, error) {
    // 1. Get segment IDs based on the lecture ID
    seg_ids, err := u.dao_s.GetSegmentsByLectureID(ctx, lecture_id)
    if err != nil {
        return nil, err
    }

    // 2. Get chat IDs and segment IDs based on user ID and segment IDs
    ChatIDsAndSegmentIDs, err := u.dao_m.GetChatIdsByUserAndSegments(ctx, user_id, seg_ids)
    if err != nil {
        return nil, err
    }

    var chat_ids []string
    for _, v := range ChatIDsAndSegmentIDs {
        chat_ids = append(chat_ids, v.ChatID)
    }

    // 3. Get messages based on chat IDs
    messages, err := u.dao_m.GetMessagesByChatIDs(ctx, chat_ids)
    if err != nil {
        return nil, err
    }

    // 4. Group messages by chat_id
    messagesByChatID := make(map[string][]*model.Message)
    for _, msg := range messages {
        messagesByChatID[msg.ChatID] = append(messagesByChatID[msg.ChatID], msg)
    }

    // 5. Create the result combining chat_id, segment_id, and grouped messages
    var result []*model.SegmentedChat
    for _, chatSegment := range ChatIDsAndSegmentIDs {
        chatID := chatSegment.ChatID
        segmentID := chatSegment.SegmentID

        // Retrieve messages for this chat_id
        msgs := messagesByChatID[chatID]

        // Construct SegmentedChat object (assuming you have such a model)
        segmentedChat := &model.SegmentedChat{
            ChatID:     chatID,
            SegmentID:  segmentID,
            Messages:   make([]*model.SegmentedMessage, 0), // Assuming SegmentedMessage exists
        }

        // Map messages to SegmentedMessage
        for _, msg := range msgs {
            segmentedChat.Messages = append(segmentedChat.Messages, &model.SegmentedMessage{
                MessageID:        msg.ID,
                Message:   msg.Message,
                IsUser:    msg.IsUser,
                CreatedAt: msg.CreatedAt,
            })
        }

        // Append the result
        result = append(result, segmentedChat)
    }

    return result, nil
}
