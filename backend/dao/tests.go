package dao

import (
	"context"
	"database/sql"
	"fairedu/infra/sqlc/tests"
	"fairedu/model"
)

type TestsDao interface {
	GetTestIDForLectureID(ctx context.Context, lecture_id string) (string, error)
	GetQuestionsForTestID(ctx context.Context, test_id string) ([]model.Question, error)
	GetChoicesForQuestionIDs(ctx context.Context, question_ids []string) ([]model.Choice, error)
	PostQuizResult(ctx context.Context, m []model.QuizResult) error
}

type testsDAO struct {
	db *sql.DB
}

func NewTestsDao(db *sql.DB) *testsDAO {
	return &testsDAO{
		db: db,
	}
}

func (d *testsDAO) GetTestIDForLectureID(ctx context.Context, lecture_id string) (string, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return "", err
	}
	query := tests.New(tx)
	response, err := query.GetTestIDForLectureID(ctx, lecture_id)
	if err != nil {
		tx.Rollback()
		return "", err
	}
	if err := tx.Commit(); err != nil {
		return "", err
	}
	return response, nil
}

func (d *testsDAO) GetQuestionsForTestID(ctx context.Context, test_id string) ([]model.Question, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := tests.New(tx)
	response, err := query.GetQuestionsForTestID(ctx, test_id)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}
	var questions []model.Question
	for _, question := range response {
		questions = append(questions, model.Question{
			ID: question.ID,
			Question: question.Text,
		})
	}
	return questions, nil
}

func (d *testsDAO) GetChoicesForQuestionIDs(ctx context.Context, question_ids []string) ([]model.Choice, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := tests.New(tx)
	response, err := query.GetChoicesForQuestionIDs(ctx, question_ids)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}
	var choices []model.Choice
	for _, choice := range response {
		choices = append(choices, model.Choice{
			ID: choice.ID,
			Choice: choice.Text,
			IsCorrect: choice.IsCorrect,
		})
	}
	return choices, nil
}

func (d *testsDAO) PostQuizResult(ctx context.Context, m []model.QuizResult) error {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return err
	}
	query := tests.New(tx)
	ids := make([]string, 0)
	user_ids := make([]string, 0)
	test_ids := make([]string, 0)
	question_ids := make([]string, 0)
	choice_ids := make([]string, 0)

	for _, v := range m {
		ids = append(ids, v.ID)
		user_ids = append(user_ids, v.UserID)
		test_ids = append(test_ids, v.TestID)
		question_ids = append(question_ids, v.QuestionID)
		choice_ids = append(choice_ids, v.ChoiceID)
	}

	params := tests.PostQuizResultParams{
		Column1: ids,
		Column2: user_ids,
		Column3: test_ids,
		Column4: question_ids,
		Column5: choice_ids,
	}
	err = query.PostQuizResult(ctx, params)
	if err != nil {
		tx.Rollback()
		return err
	}
	if err := tx.Commit(); err != nil {
		return err
	}
	return nil
}
