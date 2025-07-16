module "dynamodb_table" {
  source = "../modules/dynamodb"

    tags = var.common_tags
}

module "aws_iam_role_arn" {
  source = "../modules/iam"

  iam_role_policy_statement = {
    lambda = {
      Action = [
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:DeleteItem"
      ]
      Effect   = "Allow"
      Resource = module.dynamodb_table.dynamodb_table_arn
    }
  }

  tags = var.common_tags
}

module "lambda_function" {
  source = "../modules/lambda"

  lambda_functions = {
    "rest_api_function" = {
      source_file   = "${path.module}/lambda/lambda_function.py"
      function_name = "rest_api_lambda_function"
      role          = module.aws_iam_role_arn.iam_role_arn
      handler       = "lambda_function.lambda_handler"
      runtime       = "python3.12"
      environment = {
        DYNAMODB_TABLE = module.dynamodb_table.dynamodb_table_name
      }
    }
  }

    tags = var.common_tags
}
