package dao

import (
	"context"
	"database/sql"
	"fairedu/infra/sqlc/segments"
	"fairedu/model"

)

type SegmentsDao interface {
	SaveMaterial(ctx context.Context, m []model.SaveMaterial, user_id string) error
	GetMaterialsForLecture(ctx context.Context, lecture_id string) ([]model.Material, error)
	GetSegmentTagsByLectureID(ctx context.Context, lecture_id string) ([]model.SegmentTags, error)
	GetSegmentsByLectureID(ctx context.Context, lecture_id string) ([]string, error)
}

type segmentsDAO struct {
	db *sql.DB
}

func NewSegmentsDao(db *sql.DB) *segmentsDAO {
	return &segmentsDAO{
		db: db,
	}
}

func (d *segmentsDAO) SaveMaterial(ctx context.Context, m []model.SaveMaterial, user_id string) error {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return err
	}
	query := segments.New(tx)
	segmendIDs := make([]string, len(m))
	contents := make([]string, len(m))
	for i, v := range m {
		segmendIDs[i] = v.Segment_id
		contents[i] = v.Content
	}
	params := segments.SaveMaterialsParams{
		Column1: segmendIDs,
		Column2: contents,
		Column3: user_id,
	}
	err = query.SaveMaterials(ctx, params)
	if err != nil {
		tx.Rollback()
		return err
	}
	if err := tx.Commit(); err != nil {
		return err
	}

	return nil
}

func (d *segmentsDAO) GetMaterialsForLecture(ctx context.Context, lecture_id string) ([]model.Material, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := segments.New(tx)
	rows, err := query.GetMaterialsForLecture(ctx, lecture_id)
	if err != nil {
		return nil, err
	}

	var items []model.Material
	for _, row := range rows {
		item := model.Material{
			Segment_id: row.SegmentID,
			Voice: row.Voice,
			Content: row.Content,
		}
		items = append(items, item)
	}
	return items, nil
}

// LLM用にtagsを検索
func (d *segmentsDAO) GetSegmentTagsByLectureID(ctx context.Context, lecture_id string) ([]model.SegmentTags, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := segments.New(tx)
	rows, err := query.GetSegmentTagsByLectureID(ctx, lecture_id)
	if err != nil {
		return nil, err
	}

	var items []model.SegmentTags
	for _, row := range rows {
		item := model.SegmentTags{
			Segment_id: row.ID,
			Tags: row.Tags,
		}
		items = append(items, item)
	}
	return items, nil
}

func (d *segmentsDAO) GetSegmentsByLectureID(ctx context.Context, lecture_id string) ([]string, error) {
	tx, err := d.db.BeginTx(ctx, nil)
	if err != nil {
		return nil, err
	}
	query := segments.New(tx)
	items, err := query.GetSegmentsByLectureID(ctx, lecture_id)
	if err != nil {
		return nil, err
	}
	return items, nil
}
