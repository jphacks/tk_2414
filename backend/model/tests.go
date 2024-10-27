package model

type Question struct {
	ID string `json:"id"`
	Question string `json:"question"`
	Choices []Choice `json:"choices"`
}

type Choice struct {
	ID string `json:"id"`
	Choice string `json:"choice"`
	IsCorrect bool `json:"is_correct"`
}

type QuizResult struct {
	ID string `json:"id"`
	UserID string `json:"user_id"`
	TestID string `json:"test_id"`
	QuestionID string `json:"question_id"`
	ChoiceID string `json:"choice_id"`
}
