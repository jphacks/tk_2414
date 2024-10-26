// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0

package messages

import (
	"database/sql"
)

type Message struct {
	ID        string
	IsUser    bool
	ChatID    string
	Prev      string
	Next      string
	Message   string
	CreatedAt sql.NullTime
	UpdatedAt sql.NullTime
	DeletedAt sql.NullTime
}
