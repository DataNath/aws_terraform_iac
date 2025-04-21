variable "iam_users" {
  type = map(object({
    user_name = string
    group_name = string
    policies = list(string)
  }))
}