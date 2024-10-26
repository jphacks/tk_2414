package usecase

import (
	"context"
	"fairedu/model"
	"fairedu/dao"
)

type StructureUsecase interface {
	GetLectureStructure(ctx context.Context, lecture_id string) ([]model.LectureStructure, error)
}

type structureUsecase struct {
	dao dao.StructureDao
}

func NewStructureUsecase(d dao.StructureDao) *structureUsecase {
	return &structureUsecase{
		dao: d,
	}
}

func (u *structureUsecase) GetLectureStructure(ctx context.Context, lecture_id string) ([]model.LectureStructure, error) {
	structures, err := u.dao.GetLectureStructure(ctx, lecture_id)
	if err != nil {
		return nil, err
	}
	return structures, nil
}
