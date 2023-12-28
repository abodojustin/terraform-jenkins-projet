locals {
  common_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }

  s3_bucket_name = "${lower(local.naming_prefix)}-${random_integer.S3.result}"

  naming_prefix = "${var.naming_prefix}-${var.environment}"

}

resource "random_integer" "S3" {
  min = 10000
  max = 99999
}