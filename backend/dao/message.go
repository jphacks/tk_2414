package dao

import (
	"context"
	"database/sql"
	"fairedu/infra/sqlc/chats"
	"fairedu/infra/sqlc/messages"
	"fairedu/model"
)

type MessageDao interface {
	SendMessage(ctx context.Context, m model.Message) (*model.Message, error)
	GetMessageByChatID(ctx context.Context, chat_id string) ([]*model.Message, error)
	CreateChat(ctx context.Context, m model.Chat) (model.Chat, error)
	GetChatIdsByUserAndSegments(ctx context.Context, user_id string, segment_ids []string) ([]*model.ChatIDANDSegmentID, error)
	GetMessagesByChatIDs(ctx context.Context, chat_ids []string) ([]*model.Message, error)
}

type messageDAO struct {
	db *sql.DB
}

func NewMessageDao(db *sql.DB) *messageDAO {
	return &messageDAO{
		db: db,
	}
}

func (d *messageDAO) SendMessage(ctx context.Context, m model.Message) (*model.Message, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := messages.New(tx)
	params := messages.SendMessageParams{
		ID: m.ID,
		IsUser: m.IsUser,
		ChatID: m.ChatID,
		Message: m.Message,
	}
	response, err := query.SendMessage(ctx, params)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}

	return &model.Message{
		ID: response.ID,
		IsUser: response.IsUser,
		ChatID: response.ChatID,
		Message: response.Message,
		CreatedAt: response.CreatedAt.Time,
	}, nil
}

func (d *messageDAO) GetMessageByChatID(ctx context.Context, chat_id string) ([]*model.Message, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := messages.New(tx)
	messages, err := query.GetMessageByChatID(ctx, chat_id)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}

	var result []*model.Message
	for _, v := range messages {
		result = append(result, &model.Message{
			ID: v.ID,
			IsUser: v.IsUser,
			ChatID: v.ChatID,
			Message: v.Message,
			CreatedAt: v.CreatedAt.Time,
		})
	}
	return result, nil
}

func (d *messageDAO) CreateChat(ctx context.Context, m model.Chat) (model.Chat, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return model.Chat{}, err
	}
	query := chats.New(tx)
	params := chats.CreateChatParams{
		ID: m.ID,
		UserID: m.UserID,
		SegmentID: m.SegmentID,
	}
	response, err := query.CreateChat(ctx, params)
	if err != nil {
		tx.Rollback()
		return model.Chat{}, err
	}
	if err := tx.Commit(); err != nil {
		return model.Chat{}, err
	}

	return model.Chat{
		ID: response.ID,
		UserID: response.UserID,
		SegmentID: response.SegmentID,
	}, nil
}

func (d *messageDAO) GetChatIdsByUserAndSegments(ctx context.Context, user_id string, segment_ids []string) ([]*model.ChatIDANDSegmentID, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := chats.New(tx)
	params := chats.GetChatIdsByUserAndSegmentsParams{
		UserID: user_id,
		Column2: segment_ids,
	}
	response, err := query.GetChatIdsByUserAndSegments(ctx, params)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}
	var result []*model.ChatIDANDSegmentID
	for _, v := range response {
		result = append(result, &model.ChatIDANDSegmentID{
			ChatID: v.ID,
			SegmentID: v.SegmentID,
		})
	}

	return result, nil
}

func (d *messageDAO) GetMessagesByChatIDs(ctx context.Context, chat_ids []string) ([]*model.Message, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := messages.New(tx)
	response, err := query.GetMessagesByChatIDs(ctx, chat_ids)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}

	var result []*model.Message
	for _, v := range response {
		result = append(result, &model.Message{
			ID: v.ID,
			IsUser: v.IsUser,
			ChatID: v.ChatID,
			Message: v.Message,
			CreatedAt: v.CreatedAt.Time,
		})
	}

	return result, nil
}
