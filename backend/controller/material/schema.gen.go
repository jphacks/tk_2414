// Package material provides primitives to interact with the openapi HTTP API.
//
// Code generated by github.com/deepmap/oapi-codegen version v1.12.4 DO NOT EDIT.
package material

import (
	"bytes"
	"compress/gzip"
	"encoding/base64"
	"fmt"
	"net/http"
	"net/url"
	"path"
	"strings"

	"github.com/deepmap/oapi-codegen/pkg/runtime"
	"github.com/getkin/kin-openapi/openapi3"
	"github.com/gin-gonic/gin"
)

// SaveMaterialJSONBody defines parameters for SaveMaterial.
type SaveMaterialJSONBody = []struct {
	Content   *string `json:"content,omitempty"`
	SegmentId *string `json:"segment_id,omitempty"`
}

// SaveMaterialJSONRequestBody defines body for SaveMaterial for application/json ContentType.
type SaveMaterialJSONRequestBody = SaveMaterialJSONBody

// ServerInterface represents all server handlers.
type ServerInterface interface {
	// Get materials for lecture
	// (GET /material/{lecture_id})
	GetMaterialsForLecture(c *gin.Context, lectureId string)
	// Save material
	// (POST /material/{user_id})
	SaveMaterial(c *gin.Context, userId string)
}

// ServerInterfaceWrapper converts contexts to parameters.
type ServerInterfaceWrapper struct {
	Handler            ServerInterface
	HandlerMiddlewares []MiddlewareFunc
	ErrorHandler       func(*gin.Context, error, int)
}

type MiddlewareFunc func(c *gin.Context)

// GetMaterialsForLecture operation middleware
func (siw *ServerInterfaceWrapper) GetMaterialsForLecture(c *gin.Context) {

	var err error

	// ------------- Path parameter "lecture_id" -------------
	var lectureId string

	err = runtime.BindStyledParameter("simple", false, "lecture_id", c.Param("lecture_id"), &lectureId)
	if err != nil {
		siw.ErrorHandler(c, fmt.Errorf("Invalid format for parameter lecture_id: %s", err), http.StatusBadRequest)
		return
	}

	for _, middleware := range siw.HandlerMiddlewares {
		middleware(c)
	}

	siw.Handler.GetMaterialsForLecture(c, lectureId)
}

// SaveMaterial operation middleware
func (siw *ServerInterfaceWrapper) SaveMaterial(c *gin.Context) {

	var err error

	// ------------- Path parameter "user_id" -------------
	var userId string

	err = runtime.BindStyledParameter("simple", false, "user_id", c.Param("user_id"), &userId)
	if err != nil {
		siw.ErrorHandler(c, fmt.Errorf("Invalid format for parameter user_id: %s", err), http.StatusBadRequest)
		return
	}

	for _, middleware := range siw.HandlerMiddlewares {
		middleware(c)
	}

	siw.Handler.SaveMaterial(c, userId)
}

// GinServerOptions provides options for the Gin server.
type GinServerOptions struct {
	BaseURL      string
	Middlewares  []MiddlewareFunc
	ErrorHandler func(*gin.Context, error, int)
}

// RegisterHandlers creates http.Handler with routing matching OpenAPI spec.
func RegisterHandlers(router *gin.Engine, si ServerInterface) *gin.Engine {
	return RegisterHandlersWithOptions(router, si, GinServerOptions{})
}

// RegisterHandlersWithOptions creates http.Handler with additional options
func RegisterHandlersWithOptions(router *gin.Engine, si ServerInterface, options GinServerOptions) *gin.Engine {

	errorHandler := options.ErrorHandler

	if errorHandler == nil {
		errorHandler = func(c *gin.Context, err error, statusCode int) {
			c.JSON(statusCode, gin.H{"msg": err.Error()})
		}
	}

	wrapper := ServerInterfaceWrapper{
		Handler:            si,
		HandlerMiddlewares: options.Middlewares,
		ErrorHandler:       errorHandler,
	}

	router.GET(options.BaseURL+"/material/:lecture_id", wrapper.GetMaterialsForLecture)

	router.POST(options.BaseURL+"/material/:user_id", wrapper.SaveMaterial)

	return router
}

// Base64 encoded, gzipped, json marshaled Swagger object
var swaggerSpec = []string{

	"H4sIAAAAAAAC/8SST4vbQAzFv8qgs9mk/y6+tZSWQAuFHksp6ljJavH8WUk2GOPvXsaOs9niw4YeehqY",
	"kZ7eG/1G8CnkFCmaQj1OFXA8JqhHMLaWoIavaCSMrXv/7QAV9CTKKUINr+72d3uYKkiZImaGGt7MVxVk",
	"tPsiB7tw7t6NLXnrhH5xM5WXE1k5UiZB4xQPDdTwmWwdp5+SfFlaZkHBQEaiUP8Ygcv8MgQqiBiKzSd5",
	"qEDosWOhBmqTjipQf08B51RDLtVqwvEE0/SzFGtOUWk2/Hq/L4dP0SjODjHnlv3scfegJfl4pcdGYW7M",
	"UqIYLzJX/X9NrEDpFChacbr13Cf2tGW1Wm/S7wfyBk8XKIIDTKWkIfXC2ZYVXT7TCZkw9dQ47bwn1WPX",
	"tkPReLskft54iD223Ljzr7rDx1L6brvUSCK2Tkl6EkciSWa72oWAMix7deHi5ZhkFZ7rriDplGQlJCfd",
	"QOQ79rTGehEYZ8nbqXjsSO1Daob/CsTL1v482rQN9TYbTvFmLDjmzlyDhv+ERdnlhYsSZPoTAAD//3DO",
	"zQGPBAAA",
}

// GetSwagger returns the content of the embedded swagger specification file
// or error if failed to decode
func decodeSpec() ([]byte, error) {
	zipped, err := base64.StdEncoding.DecodeString(strings.Join(swaggerSpec, ""))
	if err != nil {
		return nil, fmt.Errorf("error base64 decoding spec: %s", err)
	}
	zr, err := gzip.NewReader(bytes.NewReader(zipped))
	if err != nil {
		return nil, fmt.Errorf("error decompressing spec: %s", err)
	}
	var buf bytes.Buffer
	_, err = buf.ReadFrom(zr)
	if err != nil {
		return nil, fmt.Errorf("error decompressing spec: %s", err)
	}

	return buf.Bytes(), nil
}

var rawSpec = decodeSpecCached()

// a naive cached of a decoded swagger spec
func decodeSpecCached() func() ([]byte, error) {
	data, err := decodeSpec()
	return func() ([]byte, error) {
		return data, err
	}
}

// Constructs a synthetic filesystem for resolving external references when loading openapi specifications.
func PathToRawSpec(pathToFile string) map[string]func() ([]byte, error) {
	var res = make(map[string]func() ([]byte, error))
	if len(pathToFile) > 0 {
		res[pathToFile] = rawSpec
	}

	return res
}

// GetSwagger returns the Swagger specification corresponding to the generated code
// in this file. The external references of Swagger specification are resolved.
// The logic of resolving external references is tightly connected to "import-mapping" feature.
// Externally referenced files must be embedded in the corresponding golang packages.
// Urls can be supported but this task was out of the scope.
func GetSwagger() (swagger *openapi3.T, err error) {
	var resolvePath = PathToRawSpec("")

	loader := openapi3.NewLoader()
	loader.IsExternalRefsAllowed = true
	loader.ReadFromURIFunc = func(loader *openapi3.Loader, url *url.URL) ([]byte, error) {
		var pathToFile = url.String()
		pathToFile = path.Clean(pathToFile)
		getSpec, ok := resolvePath[pathToFile]
		if !ok {
			err1 := fmt.Errorf("path not found: %s", pathToFile)
			return nil, err1
		}
		return getSpec()
	}
	var specData []byte
	specData, err = rawSpec()
	if err != nil {
		return
	}
	swagger, err = loader.LoadFromData(specData)
	if err != nil {
		return
	}
	return
}