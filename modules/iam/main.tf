# Create the IAM group
resource "aws_iam_group" "iac_demo_user_group" {
  name = var.group_name

}

# Attach relevant policies to the IAM group
resource "aws_iam_group_policy_attachment" "iac_demo_attach_policy" {
  for_each = toset(var.policies)

  group = aws_iam_group.iac_demo_user_group.name
  policy_arn = each.value
}

# Create IAM user(s)
resource "aws_iam_user" "iac_demo_iam_user" {
  name = var.user_name

  tags = {
    Usage       = "Access"
  }
}

# Add IAM users to the group
resource "aws_iam_group_membership" "iac_demo_add_user_to_group" {
  name = "iac-demo-admin-user-group"

  users = [
    aws_iam_user.iac_demo_iam_user.name
  ]

  group = aws_iam_group.iac_demo_user_group.name
}

# Enable an admin access key so we can have long-lasting credentials when working as this user in Terraform
resource "aws_iam_access_key" "iac_demo_access_key" {
  user = aws_iam_user.iac_demo_iam_user.name  
}