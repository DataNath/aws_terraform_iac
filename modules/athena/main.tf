# Create our AWS Athena database
resource "aws_athena_database" "iac_demo_athena_db" {
  name   = "np_iac_demo_athena"
  bucket = var.athena_results_bucket
  
}

# Create the workgroup that we'll use for Athena - cost attribution etc
resource "aws_athena_workgroup" "iac_demo_athena_workgroup" {
  name = "np_iac_demo_athena_workgroup"

  configuration {
    enforce_workgroup_configuration = true

    result_configuration {
      output_location = "s3://${var.athena_results_bucket}/output/"
    }
  }

  tags = {
    Usage       = "Workgroup"
  }
}