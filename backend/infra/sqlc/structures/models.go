// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0

package structures

import (
	"database/sql"
)

type Structure struct {
	ID        string
	LectureID string
	Name      string
	Type      string
	CreatedAt sql.NullTime
	UpdatedAt sql.NullTime
	DeletedAt sql.NullTime
}