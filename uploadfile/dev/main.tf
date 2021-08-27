


module lambda {
  source  = "../modules/lambdas" 
  function_name      = "ismaeel_create_lambda_testing"
  filename            = "../modules/lambdas/output/ismaeelCreatedFunctionp.zip"
  description        = "description should be here"
  handler            = "ismaeelCreatedFunctionp.lambda_handler"
  runtime            = "python3.7"
  # role_arn           = "${module.lambda.create_invoke_role_arn}" 


  policy =jsonencode(
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "dynamodb:PutItem",
                "dynamodb:GetItem"
            ],
            "Resource": "arn:aws:dynamodb:${var.AWS_REGION}:${var.AWS_AccountId}:table/ismaeelDB"
        }
    ]
})

  role_name = "create_role_ismaeel_testing"
}







# module "my_api_gateway" {
#   source      = "../modules/apigateways"   
#   path      = "resources"
#   endpoint    = "REGIONAL"
#   stage_name     = "dev3"
#   create_function_name2      = "${module.lambda.create_function_name2}"
#   update_function_name2    = "${module.lambda.update_function_name2}"
#   delete_function_name2     = "${module.lambda.delete_function_name2}"
#   get_function_name2      = "${module.lambda.get_function_name2}"
#   create_arn = "${module.lambda.create_arn}"
#   update_arn = "${module.lambda.update_arn}"
#   get_arn = "${module.lambda.get_arn}"
#   delete_arn = "${module.lambda.delete_arn}"


# }
