package main

import (
	"fairedu/controller/structure"
	"fairedu/controller/material"
	"fairedu/controller/message"
	"fairedu/controller/test"
	"fairedu/dao"
	"fairedu/usecase"
	"database/sql"
	"fmt"
	"log"
	"os"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
	"github.com/joho/godotenv"  // .envファイルを読み込むために追加
)

func main() {
	// .envファイルのロード
	err := godotenv.Load()
	if err != nil {
		log.Fatalf("Error loading .env file: %v", err)
	}

	router := gin.Default()

	// データベース接続情報
	dbHost := os.Getenv("DB_HOST")
	dbPort := os.Getenv("DB_PORT")
	dbUser := os.Getenv("DB_USER")
	dbPassword := os.Getenv("DB_PASSWORD")
	dbName := os.Getenv("DB_NAME")

	psqlInfo := fmt.Sprintf("host=%s port=%s user=%s "+
		"password=%s dbname=%s sslmode=disable",
		dbHost, dbPort, dbUser, dbPassword, dbName)

	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		log.Printf("Failed to open database connection: %v", err)
	}
	defer db.Close()

	// データベース接続を確認
	if err := db.Ping(); err != nil {
		log.Printf("Failed to ping database: %v", err)
	}

	// CORS設定
	router.Use(cors.New(cors.Config{
		AllowOriginFunc: func(origin string) bool {
			return true
		},
		AllowMethods: []string{
			"POST",
			"GET",
			"PUT",
			"DELETE",
			"OPTIONS",
		},
		AllowHeaders: []string{
			"tenant-id",
			"sentry-trace",
			"baggage",
			"x-api-key",
			"Access-Control-Allow-Credentials",
			"Access-Control-Allow-Headers",
			"Content-Type",
			"Content-Length",
			"Accept-Encoding",
			"Authorization",
		},
		AllowCredentials: true,
	}))
	
	// DAOの初期化
	structureDao := dao.NewStructureDao(db)
	materialDao := dao.NewSegmentsDao(db)
	messageDao := dao.NewMessageDao(db)
	testDao := dao.NewTestsDao(db)

	// UseCaseの初期化
	structureUseCase := usecase.NewStructureUsecase(structureDao)
	materialUseCase := usecase.NewMaterialUsecase(materialDao)
	messageUseCase := usecase.NewMessageUsecase(messageDao, materialDao)
	testUseCase := usecase.NewTestUsecase(testDao)

	// Controllerの初期化
	structureController := structure.NewStructureController(structureUseCase)
	materialController := material.NewMaterialController(materialUseCase)
	messageController := message.NewMessageController(messageUseCase)
	testController := test.NewTestController(testUseCase)

	// ルートの設定
	structure.RegisterHandlersWithOptions(router, structureController, structure.GinServerOptions{})
	material.RegisterHandlersWithOptions(router, materialController, material.GinServerOptions{})
	message.RegisterHandlersWithOptions(router, messageController, message.GinServerOptions{})
	test.RegisterHandlersWithOptions(router, testController, test.GinServerOptions{})	

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("Starting server on port %s", port)
	if err := router.Run(":" + port); err != nil {
		log.Printf("Failed to start server: %v", err)
	}
}
