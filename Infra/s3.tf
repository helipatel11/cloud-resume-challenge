resource "aws_s3_bucket" "my_bucket" {
  bucket = "cloud-resume-challenge-bucket1"
  force_destroy = false  # Set to true if you want Terraform to delete the bucket if removed from the config

  tags = {
    project = "challenge"
  }
}

# Enable default encryption using Amazon S3 managed keys (SSE-S3)
resource "aws_s3_bucket_server_side_encryption_configuration" "my_bucket_encryption" {
  bucket = "cloud-resume-challenge-bucket1"

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"  # SSE-S3 encryption
    }
    bucket_key_enabled = true
  }
}

# Attach the existing bucket policy from s3_policy.json
resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = "cloud-resume-challenge-bucket1"
  policy = file("s3_policy.json")  # Ensure this file exists with a valid JSON policy
}