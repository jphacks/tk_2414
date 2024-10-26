// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0

package courses

import (
	"database/sql"
)

type Course struct {
	ID          string
	Name        string
	Description string
	GradeID     string
	Subject     string
	Class       string
	Level       string
	CreatedAt   sql.NullTime
	UpdatedAt   sql.NullTime
	DeletedAt   sql.NullTime
}

type Lecture struct {
	ID          string
	CourseID    string
	Name        string
	Description string
	Prev        string
	Next        string
	CreatedAt   sql.NullTime
	UpdatedAt   sql.NullTime
	DeletedAt   sql.NullTime
}

type UserProgress struct {
	ID        string
	LectureID string
	UserID    string
	CreatedAt sql.NullTime
	UpdatedAt sql.NullTime
	DeletedAt sql.NullTime
}