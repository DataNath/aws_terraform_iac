iam_users = {
    admin = {
        user_name   = "np-iac-demo-admin-user"
        group_name  = "Admin"
        policies    = ["arn:aws:iam::aws:policy/AdministratorAccess"]
    }

    developers = {
        user_name   = "np-iac-demo-developer-user"
        group_name  = "Developers"
        policies    = ["arn:aws:iam::aws:policy/AmazonS3TablesFullAccess","arn:aws:iam::aws:policy/AmazonAthenaFullAccess"]
    }
}