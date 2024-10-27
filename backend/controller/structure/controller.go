//go:generate oapi-codegen -generate types,gin,spec,skip-prune  -package structure -o schema.gen.go ./../../reference/structure.yaml

package structure

import (
	"fairedu/controller/common"
	usecase "fairedu/usecase"
	"context"
	"net/http"
	// "log"

	gin "github.com/gin-gonic/gin"
)

type structureController struct {
	u usecase.StructureUsecase
	ServerInterface
}

func NewStructureController(u usecase.StructureUsecase) ServerInterface {
	return &structureController{
		u: u,
	}
}

func (c *structureController) GetLectureStructure(ctx *gin.Context, id string) {
	problems, err := c.u.GetLectureStructure(context.Background(), id)
	if err != nil {
		ctx.JSON(common.NewBadRequest(err.Error()))
		return
	}
	ctx.JSON(http.StatusOK, problems)
}
