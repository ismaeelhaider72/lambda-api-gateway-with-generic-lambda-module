# variable "create_function_name" {}
# variable "update_function_name" {}
# variable "delete_function_name" {}
# variable "get_function_name" {}



# variable "create_function_runtime" {}
# variable "update_function_runtime" {}
# variable "delete_function_runtime" {}
# variable "get_function_runtime" {}

# variable "function_name" {
#   type        = list(string)
#   default     = []
# }

# variable "filename" {
#   type        = list(string)
#   default     = []
# }

# variable "handler" {
#   type        = list(string)
#   default     = []
# }

# variable "role_arn" {
#   type        = list(string)
#   default     = []
# }


variable "function_name" {}
variable "filename" {}
variable "description" {}
variable "handler" {}
variable "memory_size" {
  default = ""
}
variable "runtime" {}
variable "role_name" {}
variable "policy" {
  default =""
}



#   function_name      = "lambda-name-to-deploy"
#   filename            = "../modules/lambdas/output/ismaeeelcreatefucntion2.zip"
#   description        = "description should be here"
#   handler            = "ismaeelCreatedFunctionp.lambda_handler"
#   runtime            = "python3.7"
#   memory_size        = "128"
#   lambda_timeout     = "20"
#   role_arn           = "${module.my_lambda_functions.role_arn}"



# function_name

#   create_function_name      = ""
#   update_function_name    = ""
#   delete_function_name     = ""
#   get_function_name      = ""


#   create_function_runtime = ""
#   update_function_runtime = ""
#   delete_function_runtime = ""
#   get_function_runtime = ""