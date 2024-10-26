package model

import (
	"time"
)

type Message struct {
	ID        string    `json:"id"`
	Message   string `json:"message"`
	ChatID    string    `json:"chat_id"`
	IsUser	bool   `json:"is_user"`
	CreatedAt time.Time `json:"created_at"`
}

type Conversation struct {
	UserMessage *Message   `json:"user_message"`
	BotMessage  *Message `json:"bot_message"`
}

type SegmentedMessage struct {
	MessageID string `json:"message_id"`
	Message   string `json:"message"`
	IsUser    bool   `json:"is_user"`
	CreatedAt time.Time `json:"created_at"`
}
