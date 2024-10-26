package model

type UnprocessedLecture struct {
	ID       string `json:"id"`
	Name    string `json:"name"`
	Description string `json:"description"`
	Prev string `json:"prev"`
	Next string `json:"next"`
}

type Course struct {
	ID string `json:"id"`
	Name string `json:"name"`
	Description string `json:"description"`
	GradeID string `json:"grade_id"`
	Subject string `json:"subject"`
	Class string `json:"class_"`
	Level string `json:"level"`
}

type CourseCount struct {
	CourseID string `json:"course_id"`
	Count int `json:"count"`
}

type UserProgress struct {
	Date string `json:"date"`
	LectureID []string `json:"lecture_id"`
}

type LectureName struct {
	ID string `json:"id"`
	Name string `json:"name"`
}