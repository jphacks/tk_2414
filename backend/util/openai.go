package util

import (
	"context"
	"os"
	"github.com/openai/openai-go"
	"github.com/openai/openai-go/option"
)

func GetOpenAIChatResponse(ctx context.Context, prompt string) (string, error) {
	key := os.Getenv("OPENAI_API_KEY")
	client := openai.NewClient(
		option.WithAPIKey(key), // defaults to os.LookupEnv("OPENAI_API_KEY")
	)
	response, err := client.Chat.Completions.New(context.TODO(), openai.ChatCompletionNewParams{
		Messages: openai.F([]openai.ChatCompletionMessageParamUnion{
			 openai.UserMessage(prompt),
		}),
		Model: openai.F(openai.ChatModelGPT4o),
	})
	if err != nil {
		return "", err
	}
	return response.Choices[0].Message.Content, nil
}
