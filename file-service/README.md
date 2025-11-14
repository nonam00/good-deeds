# File service

Interacts with S3 to store and serve your files using presigned URLs.

## Configuration documentation:
Configuration sets up as environment variables

- ``MINIO_ACCESS_KEY_ID`` - your minio admin login
- ``MINIO_SECRET_ACCESS_KEY`` - your minio password
- ``SERVER_PORT`` - server port
- ``SERVER_SHUTDOWN_TIMEOUT``
- ``MINIO_ENDPOINT`` - minio service endpoint
- ``MINIO_USE_SSL`` - use https when accessing minio endpoint 
- ``MINIO_PRESIGN_EXPIRY`` - presigned url expiration time
- ``MINIO_REGION`` - minio service region
- ``MINIO_BUCKETS`` - buckets that will be used by the service
- ``SECURITY_CORS_ALLOWED_ORIGINS`` - endpoints allowed by cors

## Endpoints documentation:

### Getting get presigned URL:
Redirects to presigned url
``GET /api/v1/download-url?bucket=bucket&file_id=uuid``

### Getting put presigned URL:
Generates file id and presigned url and returns it 
``POST /api/v1/upload-url``

Request:
```json
{
    "bucket": "bucket"
}
```

Response:
```json
{
    "file_id": "uuid",
    "url": "url",
    "expires_at": "timestamp_date"
}
```

### Deleting the file from S3:
``DELETE /api/v1?bucket=bucket&file_id=uuid``

### Service healthcheck:
``GET /health``

On error API returns:
```json
{
    "error": "error",
    "details": "details"
}
```