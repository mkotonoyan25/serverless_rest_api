###___IAM___ROLE_______
resource "aws_iam_role" "iam_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version   = var.iam_role_policy_version
    Statement = [var.iam_assume_role_policy["lambda"]]
  })
}


###___IAM___ROLE__Policy_____

module "db" {
  source = "../dynamodb"
}

resource "aws_iam_role_policy" "iam_role_policy" {
  name = var.iam_role_policy_name
  role = aws_iam_role.lambda_access_to_db.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
        Action   = var.iam_role_policy_statement["lambda"].Action
        Effect   = var.iam_role_policy_statement["lambda"].Effect
 #       Resource = module.db.dynamodb_table_arn  
        Resource = var.iam_role_policy_statement["lambda"].Resource
      }
    ]
  })
}

