package handler

import (
	"net/http"

	"file-service/internal/domain"
	"file-service/internal/service"
	"file-service/pkg/logger"

	"github.com/gin-gonic/gin"
)

type FileHandler struct {
	service service.FileService
	logger  *logger.Logger
}

func NewFileHandler(service service.FileService, logger *logger.Logger) *FileHandler {
	return &FileHandler{
		service: service,
		logger:  logger.WithComponent("file_handler"),
	}
}

func (h *FileHandler) GenerateUploadURL(c *gin.Context) {
	ctx := c.Request.Context()

	var req domain.UploadRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		h.logger.Warn().Err(err).Msg("Invalid upload request")
		c.JSON(http.StatusBadRequest, domain.ErrorResponse{
			Error: "Invalid request payload",
		})
		return
	}

	response, err := h.service.GenerateUploadURL(ctx, req)
	if err != nil {
		h.logger.Error().Err(err).Msg("Failed to generate upload URL")
		c.JSON(http.StatusInternalServerError, domain.ErrorResponse{
			Error: "Failed to generate upload URL",
		})
		return
	}

	c.PureJSON(http.StatusOK, response)
}

func (h *FileHandler) GenerateDownloadURL(c *gin.Context) {
	ctx := c.Request.Context()

	bucket := c.Query("bucket")
	fileID := c.Query("file_id")

	if bucket == "" || fileID == "" {
		c.JSON(http.StatusBadRequest, domain.ErrorResponse{
			Error: "Missing required parameters: bucket, file_id",
		})
		return
	}

	response, err := h.service.GenerateDownloadURL(ctx, bucket, fileID)

	if err != nil {
		h.logger.Error().Err(err).
			Str("file_id", fileID).
			Str("bucket", bucket).
			Msg("Failed to generate download URL")
		c.JSON(http.StatusInternalServerError, domain.ErrorResponse{
			Error: "Failed to generate download URL",
		})
		return
	}

	c.Redirect(http.StatusFound, response.URL)
}

func (h *FileHandler) DeleteFile(c *gin.Context) {
	ctx := c.Request.Context()

	bucket := c.Query("bucket")
	fileID := c.Query("file_id")

	if bucket == "" || fileID == "" {
		c.JSON(http.StatusBadRequest, domain.ErrorResponse{
			Error: "Missing required parameters: bucket, file_id",
		})
		return
	}

	if err := h.service.DeleteFile(ctx, bucket, fileID); err != nil {
		h.logger.Error().Err(err).
			Str("file_id", fileID).
			Str("bucket", bucket).
			Msg("Failed to delete file")
		c.JSON(http.StatusInternalServerError, domain.ErrorResponse{
			Error: "Failed to delete file",
		})
		return
	}

	c.Status(http.StatusNoContent)
}

func (h *FileHandler) HealthCheck(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"status":  "healthy",
		"service": "file-service",
	})
}
