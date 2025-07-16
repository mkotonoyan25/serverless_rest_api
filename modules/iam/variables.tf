###___IAM___ROLE_______
variable "role_name" {
  type    = string
  default = "lambda-access-dynamodb"
}

variable "iam_role_policy_version" {
  type = string
  default = "2012-10-17"
}

variable "iam_assume_role_policy" {
  type = map(object({
    Action    = string
    Effect    = string
    Sid       = string
    Principal = map(string)
  }))
  default = {
    lambda = {
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = "LambdaDynamoAccess"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }
  }
}

###___IAM___ROLE__Policy_____
variable "iam_role_policy_name" {
  type = string
  default = "lambda-access-dynamodb"
}
variable "iam_role_policy_statement" {
  type = map(object({
    Action    = list(string)
    Effect    = string
    Resource = string
  }))
}

###___Common_Tags_____
variable "common_tags" {
  type = map(string)
  default = {
    "Name" = "value"
  }
}