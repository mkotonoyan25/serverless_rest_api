resource "aws_api_gateway_rest_api" "lambda_api" {
  name        = var.lambda_api_name
  description = "This is my API for demonstration purposes"
}

variable "lambda_api_name" {
  type = string
  default = "LAMBDA_API_GATEWAY"
}

resource "aws_api_gateway_resource" "lambda_api_resource" {
  rest_api_id = aws_api_gateway_rest_api.lambda_api.id
  parent_id   = aws_api_gateway_rest_api.lambda_api.root_resource_id
  path_part   = "items"
}

resource "aws_api_gateway_method" "get_method" {
  rest_api_id   = aws_api_gateway_rest_api.lambda_api.id
  resource_id   = aws_api_gateway_resource.lambda_api_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

# resource "aws_api_gateway_authorizer" "my_authorizer" {
#   name                    = "cognito-authorizer"
#   rest_api_id            = aws_api_gateway_rest_api.lambda_api.id
#   identity_source        = "method.request.header.Authorization"
#   type                   = "COGNITO_USER_POOLS"
#   provider_arns          = [aws_cognito_user_pool.my_user_pool.arn]
# }

resource "aws_api_gateway_method" "put_method" {
  rest_api_id = aws_api_gateway_rest_api.lambda_api.id
  resource_id = aws_api_gateway_resource.lambda_api_resource.id
  http_method = "PUT"
#   authorization = "COGNITO_USER_POOLS"
authorization = "NONE"
}

