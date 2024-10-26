//go:generate oapi-codegen -generate types,gin,spec,skip-prune  -package material -o schema.gen.go ./../../reference/material.yaml

package material

import (
	"fairedu/controller/common"
	usecase "fairedu/usecase"
	"fairedu/model"
	"context"
	"net/http"
	// "log"

	gin "github.com/gin-gonic/gin"
)

type materialController struct {
	u usecase.MaterialUsecase
	ServerInterface
}

func NewMaterialController(u usecase.MaterialUsecase) ServerInterface {
	return &materialController{
		u: u,
	}
}

func (c *materialController) SaveMaterial(ctx *gin.Context, user_id string) {
	var m []model.SaveMaterial
	err := ctx.BindJSON(&m)
	if err != nil {
		ctx.JSON(common.NewBadRequest(err.Error()))
		return
	}
	err = c.u.SaveMaterial(context.Background(), m, user_id)
	if err != nil {
		ctx.JSON(common.NewBadRequest(err.Error()))
		return
	}
	ctx.JSON(http.StatusOK, nil)
}

func (c *materialController) GetMaterialsForLecture(ctx *gin.Context, lecture_id string) {
	problems, err := c.u.GetMaterialsForLecture(context.Background(), lecture_id)
	if err != nil {
		ctx.JSON(common.NewBadRequest(err.Error()))
		return
	}
	ctx.JSON(http.StatusOK, problems)
}
