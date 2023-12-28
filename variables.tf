variable "aws_region" {
  type        = string
  description = "Region Name"
  default     = "us-east-1"
}

# variable "app_version" {
# }

variable "project" {
  type        = string
  description = "Project name for resource tagging"
}

variable "billing_code" {
  type        = string
  description = "Billing Code for resource tagging"
}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "Teachmemore"
}

variable "key_bucker_s3" {
  type        = string
  description = "Key s3"
  default     = "v1.0.0/example.zip"
}

variable "environment" {
  type        = string
  description = "Environment Type"
  default     = "dev"
}

variable "function_name" {
  type        = string
  description = "Function Lambda Name"
  default     = "ServerlessFunctionExample"
}

variable "lambda_role" {
  type        = string
  description = "Role Lambda Name"
  default     = "serverless_example_lambda"
}

variable "naming_prefix" {
  type        = string
  description = "Préfixe de dénomination"
  default     = "serverless-app"
}