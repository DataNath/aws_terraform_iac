variable "user_name" {
    type = string
}

variable "group_name" {
    type = string
    default = "Admin"  
}

variable "policies" {
    type = list(string)
    default = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}