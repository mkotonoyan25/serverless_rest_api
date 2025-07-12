###___Common_Tags_____
variable "common_tags" {
  type = map(string)
}

###___DynamoDB_Table__
variable "table_name" {
  type = string
}

variable "billing_mode" {
  type    = string
  default = "PAY_PER_REQUEST"
}

variable "partition_key" {
  type    = string
  default = "my-user"
}

variable "partition_key_type" {
  type    = string
  default = "S"
}