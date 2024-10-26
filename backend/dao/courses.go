package dao

import (
	"context"
	"database/sql"
	"fairedu/infra/sqlc/courses"
	"fairedu/model"
)

type CourseDao interface {
	GetLecturesByCourseID(ctx context.Context, course_id string) ([]model.UnprocessedLecture, error)
	InsertUserProgress(ctx context.Context, user_id string, lecture_id string) error
	SelectOngoingProgressByUserID(ctx context.Context, user_id string) ([]string, error)
	GetCourseIDsByLectureIDs(ctx context.Context, lecture_ids []string) ([]string, error)
	GetCourseNamesByCourseIDs(ctx context.Context, course_ids []string) ([]string, error)
	GetCountLecturesByCourseIDs(ctx context.Context, course_ids []string) ([]model.CourseCount, error)
	GetCountLecturesByUser(ctx context.Context, lecture_ids []string) ([]model.CourseCount, error)
	SelectUserProgressByUserIDAndMonth(ctx context.Context, user_id string, month sql.NullTime) ([]model.UserProgress, error)
	GetLectureNamesByLectureIDs(ctx context.Context, lecture_ids []string) ([]model.LectureName, error)
	SelectTakingCoursesByUserID(ctx context.Context, user_id string) ([]model.Course, error)
}

type courseDAO struct {
	db *sql.DB
}

func NewCourseDao(db *sql.DB) *courseDAO {
	return &courseDAO{
		db: db,
	}
}

func (d *courseDAO) GetLecturesByCourseID(ctx context.Context, course_id string) ([]model.UnprocessedLecture, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := courses.New(tx)
	response, err := query.SelectLecturesByCourseID(ctx, course_id)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}

	var lectures []model.UnprocessedLecture
	for _, lecture := range response {
		lectures = append(lectures, model.UnprocessedLecture{
			ID: lecture.ID,
			Name: lecture.Name,
			Description: lecture.Description,
			Prev: lecture.Prev,
			Next: lecture.Next,
		})
	}
	return lectures, nil
}

func (d *courseDAO) InsertUserProgress(ctx context.Context, user_id string, lecture_id string) error {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return err
	}
	query := courses.New(tx)
	params := courses.InsertUserProgressParams{
		UserID: user_id,
		LectureID: lecture_id,
	}
	_, err = query.InsertUserProgress(ctx, params)
	if err != nil {
		tx.Rollback()
		return err
	}
	if err := tx.Commit(); err != nil {
		return err
	}
	return nil
}

// ユーザーの講義ごとの進捗を取得するメソッドたち
func (d *courseDAO) SelectOngoingProgressByUserID(ctx context.Context, user_id string) ([]string, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := courses.New(tx)
	lectures, err := query.SelectOngoingProgressByUserID(ctx, user_id)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}
	return lectures, nil
}

func (d *courseDAO) GetCourseIDsByLectureIDs(ctx context.Context, lecture_ids []string) ([]string, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := courses.New(tx)
	courses, err := query.GetCourseIDsByLectureIDs(ctx, lecture_ids)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}
	return courses, nil
}

func (d *courseDAO) GetCourseNamesByCourseIDs(ctx context.Context, course_ids []string) ([]string, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := courses.New(tx)
	courses, err := query.GetCourseNamesByCourseIDs(ctx, course_ids)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}
	return courses, nil
}

func (d *courseDAO) GetCountLecturesByCourseIDs(ctx context.Context, course_ids []string) ([]model.CourseCount, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := courses.New(tx)
	counts, err := query.GetCountLecturesByCourseIDs(ctx, course_ids)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}
	var courseCounts []model.CourseCount
	for _, count := range counts {
		courseCounts = append(courseCounts, model.CourseCount{
			CourseID: count.CourseID,
			Count: int(count.Count),
		})
	}
	return courseCounts, nil
}

func (d *courseDAO) GetCountLecturesByUser(ctx context.Context, lecture_ids []string) ([]model.CourseCount, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := courses.New(tx)
	counts, err := query.GetCountLecturesByUser(ctx, lecture_ids)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}
	var courseCounts []model.CourseCount
	for _, count := range counts {
		courseCounts = append(courseCounts, model.CourseCount{
			CourseID: count.CourseID,
			Count: int(count.Count),
		})
	}
	return courseCounts, nil
}

//月ごとに各日の進捗を取得するメソッド
func (d *courseDAO) SelectUserProgressByUserIDAndMonth(ctx context.Context, user_id string, month sql.NullTime) ([]model.UserProgress, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := courses.New(tx)
	params := courses.SelectUserProgressByUserIDAndMonthParams{
		UserID: user_id,
		CreatedAt: month,
	}
	progresses, err := query.SelectUserProgressByUserIDAndMonth(ctx, params)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}
	var userProgress []model.UserProgress
	for _, progress := range progresses {
		lecture_ids, ok := progress.LectureIds.([]string)
		if !ok {
			return nil, err
		}
		userProgress = append(userProgress, model.UserProgress{
			LectureID: lecture_ids,
			Date: progress.Date,
		})
	}
	return userProgress, nil
}

func (d *courseDAO) GetLectureNamesByLectureIDs(ctx context.Context, lecture_ids []string) ([]model.LectureName, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := courses.New(tx)
	lecture, err := query.GetLectureNamesByLectureIDs(ctx, lecture_ids)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}
	var lectures []model.LectureName
	for _, l := range lecture {
		lectures = append(lectures, model.LectureName{
			ID: l.ID,
			Name: l.Name,
		})
	}
	return lectures, nil
}

func (d *courseDAO) SelectTakingCoursesByUserID(ctx context.Context, user_id string) ([]model.Course, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := courses.New(tx)
	courses, err := query.SelectTakingCoursesByUserID(ctx, user_id)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}
	var result []model.Course
	for _, c := range courses {
		result = append(result, model.Course{
			ID: c.CourseID,
			Name: c.Name,
			Description: c.Description,
			GradeID: c.GradeID,
			Subject: c.Subject,
			Level: c.Level,
		})
	}
	return result, nil
}
