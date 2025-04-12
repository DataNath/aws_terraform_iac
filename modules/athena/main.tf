# Create our AWS Athena database
resource "aws_athena_database" "iac_demo_athena_db" {
  name   = "np_iac_demo_athena"
  bucket = aws_s3_bucket.iac_demo_s3_bucket.id
  
}

# Create the workgroup that we'll use for Athena - cost attribution etc
resource "aws_athena_workgroup" "iac_demo_athena_workgroup" {
  name = "np_iac_demo_athena_workgroup"

  configuration {
    enforce_workgroup_configuration = true

    result_configuration {
      output_location = "s3://${aws_s3_bucket.iac_demo_s3_bucket.bucket}/output/"
    }
  }

  tags = {
    Usage       = "Workgroup"
  }
}