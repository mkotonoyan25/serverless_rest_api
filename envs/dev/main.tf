# module "db" {
#   source = "../../modules/dynamodb"
#   # Other vars...
# }

# module "iam" {
#   source = "../../modules/iam"

#   iam_role_policy_statement = {
#     lambda = {
#       Action = [
#         "dynamodb:GetItem",
#         "dynamodb:PutItem",
#       ]
#       Effect   = "Allow"
#       Resource = module.db.dynamodb_table_arn
#     }
#   }

#   role_name = "lambda-access-db-role"
# }
