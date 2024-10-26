//go:generate oapi-codegen -generate types,gin,spec,skip-prune  -package test -o schema.gen.go ./../../reference/test.yaml

package test

import (
	"fairedu/controller/common"
	usecase "fairedu/usecase"
	"fairedu/model"
	"context"
	"net/http"
	// "log"

	gin "github.com/gin-gonic/gin"
)

type testController struct {
	u usecase.TestUsecase
	ServerInterface
}

func NewTestController(u usecase.TestUsecase) ServerInterface {
	return &testController{
		u: u,
	}
}

func (c *testController) GetQuizByLectureID(ctx *gin.Context, lecture_id string) {
	problems, err := c.u.GetQuizByLectureID(context.Background(), lecture_id)
	if err != nil {
		ctx.JSON(common.NewBadRequest(err.Error()))
		return
	}
	ctx.JSON(http.StatusOK, problems)
}

func (c *testController) PostQuizResult(ctx *gin.Context) {
	var m []model.QuizResult
	err := ctx.BindJSON(&m)
	if err != nil {
		ctx.JSON(common.NewBadRequest(err.Error()))
		return
	}
	err = c.u.PostQuizResult(context.Background(), m)
	if err != nil {
		ctx.JSON(common.NewBadRequest(err.Error()))
		return
	}
	ctx.JSON(http.StatusOK, nil)
}
