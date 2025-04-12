# Create an 'Admin' IAM group
resource "aws_iam_group" "iac_demo_admin_user_group" {
  name = "Admin"

}

# Attach the AdministratorAccess policy to the 'Admin' IAM group
resource "aws_iam_group_policy_attachment" "iac_demo_attach_admin_policy" {
  group = aws_iam_group.iac_demo_admin_user_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Create an admin IAM user
resource "aws_iam_user" "iac_demo_iam_user" {
  name = "np-iac-demo-admin-user"

  tags = {
    Usage       = "Access"
  }
}

# Add admin user to the AdminAccess group in AWS
resource "aws_iam_group_membership" "iac_demo_add_admin" {
  name = "iac-demo-admin-user-group"

  users = [
    aws_iam_user.iac_demo_iam_user.name
  ]

  group = aws_iam_group.iac_demo_admin_user_group.name
}

# Enable an access key so we can have long-lasting credentials when working as this user in Terraform
resource "aws_iam_access_key" "iac_demo_admin_access_key" {
  user = aws_iam_user.iac_demo_iam_user.name  
}