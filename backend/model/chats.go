package model

import (
	"time"
)

type Chat struct {
	ID        string    `json:"id"`
	UserID	string    `json:"user_id"`
	SegmentID	string    `json:"segment_id"`
	CreatedAt time.Time `json:"created_at"`
}

type SegmentedChat struct {
	ChatID   string    `json:"chat_id"`
	SegmentID string    `json:"segment_id"`
	Messages []*SegmentedMessage `json:"messages"`
}
