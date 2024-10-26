//go:generate oapi-codegen -generate types,spec,skip-prune -package common -o schema.gen.go ./../../reference/common.yaml

package common

import (
	"net/http"
)

// エラーコードを定義
const (
	NotFoundErrorCode    = "not_found"
	ValidationErrorCode  = "validation_error"
	InternalServerErrorCode = "internal_server_error"
	BadRequestErrorCode  = "bad_request"
	AuthErrorCode = "auth_error"
)

// BadRequestのエラーレスポンスを生成
func NewBadRequest(msg string) (httpStatusCode int, respModel *BadRequest) {
	code := BadRequestErrorCode
	return http.StatusBadRequest, &BadRequest{
		Code: code,
		Msg:  msg,
	}
}

// NotFoundエラーレスポンスを生成
func NewNotFound(msg string) (httpStatusCode int, respModel *NotFound) {
	code := NotFoundErrorCode
	return http.StatusNotFound, &NotFound{
		Code: code,
		Msg:  msg,
	}
}

// InternalServerErrorエラーレスポンスを生成
func NewInternalServerError(msg string) (httpStatusCode int, respModel *InternalServerError) {
	code := InternalServerErrorCode
	return http.StatusInternalServerError, &InternalServerError{
		Code: code,
		Msg:  msg,
	}
}

// Unauthorizedエラーレスポンスを生成
func NewUnauthorized(msg string) (httpStatusCode int, respModel *Unauthorized) {
	code := AuthErrorCode
	return http.StatusUnauthorized, &Unauthorized{
		Code: code,
		Msg:  msg,
	}
}

// ValidationErrorエラーレスポンスを生成
func NewValidationError(msg string) (httpStatusCode int, respModel *ValidationError) {
	code := ValidationErrorCode
	return http.StatusBadRequest, &ValidationError{
		Code: code,
		Msg:  msg,
	}
}
