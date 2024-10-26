package dao

import (
	"database/sql"
	"context"
	"fairedu/infra/sqlc/structures"
	"fairedu/model"
	// "log"
)

type StructureDao interface {
	GetLectureStructure(ctx context.Context, lecture_id string) ([]model.LectureStructure, error)
}

type structureDAO struct {
	db *sql.DB
}

func NewStructureDao(db *sql.DB) *structureDAO {
	return &structureDAO{
		db: db,
	}
}

func (d *structureDAO) GetLectureStructure(ctx context.Context, lecture_id string) ([]model.LectureStructure, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := structures.New(tx)
	lectureStructure, err := query.GetLectureStructure(ctx, lecture_id)
	if err != nil {
		tx.Rollback()
		return nil, err
	}
	if err := tx.Commit(); err != nil {
		return nil, err
	}

	var result []model.LectureStructure
	for _, v := range lectureStructure {
		result = append(result, model.LectureStructure{
			Name: v.Name,
			Str_type: v.Type,
		})
	}
	return result, nil
}
