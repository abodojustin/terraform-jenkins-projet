
resource "aws_lambda_function" "example" {
  function_name = var.function_name

  # The bucket name as created earlier with "aws s3api create-bucket"
  s3_bucket = local.s3_bucket_name
  s3_key    = var.key_bucker_s3

  depends_on = [aws_s3_bucket.serverless_bucket, aws_s3_object.api_content]

  # "main" is the filename within the zip file (main.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "main.handler"
  runtime = "nodejs18.x"

  role = aws_iam_role.lambda_exec.arn

  tags = merge(local.common_tags, { Name = "${local.naming_prefix}-lambda" })

}

# IAM role which dictates what other AWS services the Lambda function
# may access.
resource "aws_iam_role" "lambda_exec" {
  name = var.lambda_role

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.example.function_name
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn = "${aws_api_gateway_rest_api.example.execution_arn}/*/*"
}