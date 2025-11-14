package service

import (
	"context"
	"file-service/internal/domain"
	"file-service/internal/storage"
	"file-service/pkg/logger"
	"fmt"

	"github.com/google/uuid"
)

type FileService interface {
	GenerateUploadURL(ctx context.Context, req domain.UploadRequest) (*domain.PresignedURLResponse, error)
	GenerateDownloadURL(ctx context.Context, bucket string, fileID string) (*domain.PresignedURLResponse, error)
	DeleteFile(ctx context.Context, bucket string, fileID string) error
}

type fileService struct {
	storage storage.MinioClient
	logger  *logger.Logger
}

func NewFileService(storage *storage.MinioClient, logger *logger.Logger) FileService {
	return &fileService{
		storage: *storage,
		logger:  logger.WithComponent("file_service"),
	}
}

func (s *fileService) GenerateUploadURL(ctx context.Context, req domain.UploadRequest) (*domain.PresignedURLResponse, error) {
	bucketExists, err := s.storage.CheckBucketExists(ctx, req.Bucket)
	if err != nil {
		s.logger.Error().Err(err).
			Str("bucket", req.Bucket).
			Msg("Failed to check bucket existence")
		return nil, fmt.Errorf("failed to check bucket %s existence: %w", req.Bucket, err)
	}

	if !bucketExists {
		s.logger.Warn().
			Str("bucket", req.Bucket).
			Msg("File not found")
		return nil, fmt.Errorf("bucket does not exist: %s", req.Bucket)
	}

	fileID := uuid.New().String()

	presignedURL, err := s.storage.GeneratePresignedPutURL(ctx, req, fileID)
	if err != nil {
		s.logger.Error().Err(err).
			Str("bucket", req.Bucket).
			Msg("Failed to generate upload URL")
		return nil, fmt.Errorf("failed to generate upload URL: %w", err)
	}

	s.logger.Info().
		Str("file_id", fileID).
		Str("bucket", req.Bucket).
		Msg("Upload URL generated successfully")

	return presignedURL, nil
}

func (s *fileService) GenerateDownloadURL(ctx context.Context, bucket string, fileID string) (*domain.PresignedURLResponse, error) {
	bucketExists, err := s.storage.CheckBucketExists(ctx, bucket)
	if err != nil {
		s.logger.Error().Err(err).
			Str("bucket", bucket).
			Msg("Failed to check bucket existence")
		return nil, fmt.Errorf("failed to check bucket %s existence: %w", bucket, err)
	}

	if !bucketExists {
		s.logger.Warn().
			Str("bucket", bucket).
			Msg("File not found")
		return nil, fmt.Errorf("bucket does not exist: %s", bucket)
	}

	fileExists, err := s.storage.CheckFileExists(ctx, bucket, fileID)

	if err != nil {
		s.logger.Error().Err(err).
			Str("file_id", fileID).
			Str("bucket", bucket).
			Msg("Failed to check file existence")
		return nil, fmt.Errorf("failed to check file %s existence: %w", fileID, err)
	}

	if !fileExists {
		s.logger.Warn().
			Str("file_id", fileID).
			Str("bucket", bucket).
			Msg("File not found")
		return nil, fmt.Errorf("file not found: %s", fileID)
	}

	presignedURL, err := s.storage.GeneratePresignedGetURL(ctx, bucket, fileID)

	if err != nil {
		s.logger.Error().Err(err).
			Str("file_id", fileID).
			Str("bucket", bucket).
			Msg("Failed to generate download URL")
		return nil, fmt.Errorf("failed to generate download URL: %w", err)
	}

	s.logger.Info().
		Str("file_id", fileID).
		Str("bucket", bucket).
		Msg("Download URL generated successfully")

	return presignedURL, nil
}

func (s *fileService) DeleteFile(ctx context.Context, bucket string, fileID string) error {
	bucketExists, err := s.storage.CheckBucketExists(ctx, bucket)
	if err != nil {
		s.logger.Error().Err(err).
			Str("bucket", bucket).
			Msg("Failed to check bucket existence")
		return fmt.Errorf("failed to check bucket %s existence: %w", bucket, err)
	}

	if !bucketExists {
		s.logger.Warn().
			Str("bucket", bucket).
			Msg("File not found")
		return fmt.Errorf("bucket does not exist: %s", bucket)
	}

	fileExists, err := s.storage.CheckFileExists(ctx, bucket, fileID)

	if err != nil {
		s.logger.Error().Err(err).
			Str("file_id", fileID).
			Str("bucket", bucket).
			Msg("Failed to check file existence")
		return fmt.Errorf("failed to check file %s existence: %w", fileID, err)
	}

	if !fileExists {
		s.logger.Warn().
			Str("file_id", fileID).
			Str("bucket", bucket).
			Msg("File not found")
		return fmt.Errorf("file not found: %s", fileID)
	}

	if err := s.storage.DeleteFile(ctx, bucket, fileID); err != nil {
		s.logger.Error().Err(err).
			Str("file_id", fileID).
			Str("bucket", bucket).
			Msg("Failed to delete file")
		return fmt.Errorf("failed to delete file: %w", err)
	}

	s.logger.Info().
		Str("file_id", fileID).
		Str("bucket", bucket).
		Msg("File deleted successfully")

	return nil
}
