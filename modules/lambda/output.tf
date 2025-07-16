output "lambda_function_arns" {
  value = [for i in aws.aws_lambda_function.lambda_function : i.arn]
}
