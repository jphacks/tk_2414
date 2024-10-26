//go:generate oapi-codegen -generate types,gin,spec,skip-prune  -package message -o schema.gen.go ./../../reference/message.yaml

package message

import (
	"context"
	"fairedu/controller/common"
	"fairedu/model"
	usecase "fairedu/usecase"
	"net/http"

	// "log"

	gin "github.com/gin-gonic/gin"
)

type messageController struct {
	u usecase.MessageUsecase
	ServerInterface
}

func NewMessageController(u usecase.MessageUsecase) ServerInterface {
	return &messageController{
		u: u,
	}
}

func (c *messageController) ProcessMessage(ctx *gin.Context, lecture_id string, user_id string) {
	var m model.Message
	err := ctx.BindJSON(&m)
	if err != nil {
		ctx.JSON(common.NewBadRequest(err.Error()))
		return
	}
	conversation, err := c.u.ProcessMessage(context.Background(), m, lecture_id, user_id)
	if err != nil {
		ctx.JSON(common.NewBadRequest(err.Error()))
		return
	}
	ctx.JSON(http.StatusOK, conversation)
}

func (c *messageController) GetMessagesByChatID(ctx *gin.Context, chat_id string) {
	messages, err := c.u.GetMessagesByChatID(context.Background(), chat_id)
	if err != nil {
		ctx.JSON(common.NewBadRequest(err.Error()))
		return
	}
	ctx.JSON(http.StatusOK, messages)
}

func (c *messageController) GetChatsByUserIDAndLectureID(ctx *gin.Context, user_id string, lecture_id string) {
	chats, err := c.u.GetChatsByUserIDAndLectureID(context.Background(), user_id, lecture_id)
	if err != nil {
		ctx.JSON(common.NewBadRequest(err.Error()))
		return
	}
	ctx.JSON(http.StatusOK, chats)
}
