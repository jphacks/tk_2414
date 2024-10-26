package usecase

import (
	"context"
	"fairedu/dao"
	"fairedu/model"

	// "log"
	"github.com/google/uuid"
)

type TestUsecase interface {
	GetQuizByLectureID(ctx context.Context, lecture_id string) ([]model.Question, error)
	PostQuizResult(ctx context.Context, quizResult []model.QuizResult) error
}

type testUsecase struct {
	dao dao.TestsDao
}

func NewTestUsecase(d dao.TestsDao) *testUsecase {
	return &testUsecase{
		dao: d,
	}
}

func (u *testUsecase) GetQuizByLectureID(ctx context.Context, lecture_id string) ([]model.Question, error) {
	text_ids, err := u.dao.GetTestIDForLectureID(ctx, lecture_id)
	if err != nil {
		return nil, err
	}
	qs, err := u.dao.GetQuestionsForTestID(ctx, text_ids)
	if err != nil {
		return nil, err
	}
	var question_ids []string
	for _, q := range qs {
		question_ids = append(question_ids, q.ID)
	}

	choices, err := u.dao.GetChoicesForQuestionIDs(ctx, question_ids)
	if err != nil {
		return nil, err
	}

	var questions []model.Question
	for _, q := range qs {
		var c []model.Choice
		for _, choice := range choices {
			c = append(c, model.Choice{
				ID: choice.ID,
				Choice: choice.Choice,
				IsCorrect: choice.IsCorrect,
			})
		}
		questions = append(questions, model.Question{
			ID: q.ID,
			Question: q.Question,
			Choices: c,
		})
	}
	return questions, nil
}

func (u *testUsecase) PostQuizResult(ctx context.Context, quizResult []model.QuizResult) error {
	for i := range quizResult {
		quizResult[i].ID = uuid.New().String()
	}
	err := u.dao.PostQuizResult(ctx, quizResult)
	if err != nil {
		return err
	}
	return nil
}
