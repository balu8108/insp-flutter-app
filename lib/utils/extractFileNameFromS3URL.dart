String extractFileNameFromS3URL(String s3FileKey) {
  if (s3FileKey != null && s3FileKey.isNotEmpty) {
    return s3FileKey.split('/').last;
  }
  return '';
}
