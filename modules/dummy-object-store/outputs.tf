output "bucket_name" {
  description = "Name of the sample bucket."
  value       = aws_s3_bucket.this.bucket
}
