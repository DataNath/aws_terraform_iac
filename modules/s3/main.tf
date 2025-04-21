# Create our S3 bucket for storage - input files and Athena outputs
resource "aws_s3_bucket" "iac_demo_s3_bucket" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Usage       = "Storage"
  }
}