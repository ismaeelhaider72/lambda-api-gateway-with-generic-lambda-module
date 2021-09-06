resource "aws_iam_role_policy" "policy" {
  name = "policy"
  role = aws_iam_role.create_role2.id

  policy = var.policy     
}


resource "aws_iam_role" "create_role2" {
  name = var.role_name

  assume_role_policy =  jsonencode(
{
    "Version" : "2012-10-17" ,
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Effect" : "Allow",
        "Sid"    : "",
        "Principal" : {
          "Service" : "lambda.amazonaws.com" 
        }
      }
    ]
  })

}


resource "aws_lambda_function" "my_lambda" {
  filename      = var.filename
  function_name = var.function_name 
  # role          = var.role_arn
  role          =  aws_iam_role.create_role2.arn
  handler       = var.handler 
  runtime       =      "${var.runtime}" 
  memory_size = var.memory_size != "" ? var.memory_size : null    

}




# locals{

#     lambda_zip_location_create = "${path.module}/output/ismaeelCreatedFunctionp.zip"
#     lambda_zip_location_get = "${path.module}/output/ismaeelGetITFucntionp.zip"
#     lambda_zip_location_delete = "${path.module}/output/ismaeeldeleteFunctionp.zip"
#     lambda_zip_location_update = "${path.module}/output/ismaeelUpdateFunctionp.zip"
# }




data "archive_file" "create" {
  type        = "zip"
  source_file = "${path.module}/lambda_functions/ismaeelCreatedFunctionp.py"
  output_path = "${path.module}/output/ismaeelCreatedFunctionp.zip"
}



data "archive_file" "get" {
  type        = "zip"
  source_file = "${path.module}/lambda_functions/ismaeelGetITFucntionp.py"
  output_path = "${path.module}/output/ismaeelGetITFucntionp.zip"
}


data "archive_file" "delete" {
  type        = "zip"
  source_file = "${path.module}/lambda_functions/ismaeeldeleteFunctionp.py"
  output_path = "${path.module}/output/ismaeeldeleteFunctionp.zip"
}


data "archive_file" "update" {
  type        = "zip"
  source_file = "${path.module}/lambda_functions/ismaeelUpdateFunctionp.py"
  output_path = "${path.module}/output/ismaeelUpdateFunctionp.zip"
}






///////////////////////////////// create function ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////








# ///////////////////////////////// get function ////////////////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////////////////////////////////////////////////////


# resource "aws_lambda_function" "get_lambda" {
#   filename      = "${local.lambda_zip_location_get}"
#   function_name = "${var.get_function_name}"
#   role          = aws_iam_role.get_role.arn
#   handler       = "ismaeelGetITFucntionp.lambda_handler"

#   #source_code_hash = filebase64sha256("lambda_function_payload.zip")

#   runtime = "${var.get_function_runtime}"


# }




# ///////////////////////////////// delete function ////////////////////////////////////////////////////////////////////

# ////////////////////////////////////////////////////////////////////////////////////////////////////////


# resource "aws_lambda_function" "delete_lambda" {
#   filename      = "${local.lambda_zip_location_delete}"
#   function_name = "${var.delete_function_name}"
#   role          = aws_iam_role.delete_role.arn
#   handler       = "ismaeeldeleteFunctionp.lambda_handler"

#   #source_code_hash = filebase64sha256("lambda_function_payload.zip")

#   runtime = "${var.delete_function_runtime}"


# }




# ///////////////////////////////// update function ////////////////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////////////////////////////////////////////////////


# resource "aws_lambda_function" "update_lambda" {
#   filename      = "${local.lambda_zip_location_update}"
#   function_name = "${var.update_function_name}"
#   role          = aws_iam_role.update_role.arn
#   #role          = "arn:aws:iam::489994096722:role/service-role/ismaeelUpdateFunction-role-0vtte6k9"
#   handler       = "ismaeelUpdateFunctionp.lambda_handler"

#   #source_code_hash = filebase64sha256("lambda_function_payload.zip")

#   runtime ="${var.update_function_runtime}"


# }




//////////////////



