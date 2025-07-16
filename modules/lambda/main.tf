
locals {
  lambda_function = var.lambda_functions
}

# Package the Lambda function code
data "archive_file" "rest_api_function_file" {
  for_each = var.lambda_functions

  type        = "zip"
  source_file = each.value.source_file
  output_path = "${path.module}/lambda/${each.key}.zip"
}

# Lambda function
resource "aws_lambda_function" "lambda_function" {
  for_each         = local.lambda_function
  filename         = data.archive_file.rest_api_function_file[each.key].output_path
  function_name    = each.value.function_name
  role             = each.value.role
  handler          = each.value.handler
  source_code_hash = data.archive_file.rest_api_function_file[each.key].output_base64sha256
  runtime          = each.value.runtime

  environment {
    variables = each.value.environment
  }

  tags = {
    Environment = "production"
    Application = "example"
  }
}
