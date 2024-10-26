package usecase

import (
	"fairedu/model"
	"fairedu/dao"
	"context"
)

type MaterialUsecase interface {
	SaveMaterial(ctx context.Context, m []model.SaveMaterial, user_id string) error
	GetMaterialsForLecture(ctx context.Context, lecture_id string) ([]model.Material, error)
}

type materialUsecase struct {
	dao dao.SegmentsDao
}

func NewMaterialUsecase(d dao.SegmentsDao) *materialUsecase {
	return &materialUsecase{
		dao: d,
	}
}

func (u *materialUsecase) SaveMaterial(ctx context.Context, m []model.SaveMaterial, user_id string) error {
	err := u.dao.SaveMaterial(ctx, m, user_id)
	if err != nil {
		return err
	}
	return nil
}

func (u *materialUsecase) GetMaterialsForLecture(ctx context.Context, lecture_id string) ([]model.Material, error) {
	materials, err := u.dao.GetMaterialsForLecture(ctx, lecture_id)
	if err != nil {
		return nil, err
	}
	return materials, nil
}
