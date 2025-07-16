###___Common_Tags_____
variable "common_tags" {
  type = map(string)
  default = {
    "Name" = "value"
  }
}
###___Lambda__Vars___
variable "lambda_functions" {
  type = map(object({
    source_file   = string
    function_name = string
    role          = string
    handler       = string
    runtime       = string
    environment   = map(string)
  }))
}
