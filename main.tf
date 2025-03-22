resource "aws_s3_bucket" "iac_demo_bucket" {
  bucket        = "nathan-iac-demo"
  force_destroy = true

  tags = {
    Environment = "Sandbox"
    Updated     = "True"
  }
}