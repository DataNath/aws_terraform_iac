module "iam" {
  for_each = var.iam_users

  source      = "./modules/iam"
  user_name   = each.value.user_name
  group_name  = each.value.group_name
  policies    = each.value.policies
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "np-iac-demo-s3"
}

module "athena" {
  source                = "./modules/athena"
  athena_results_bucket = module.s3.bucket_name
}