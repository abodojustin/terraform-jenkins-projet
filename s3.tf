resource "aws_s3_bucket" "serverless_bucket" {
  bucket        = local.s3_bucket_name
  force_destroy = true

  tags = merge(local.common_tags, { Name = "${local.naming_prefix}-bucket" })
}

resource "aws_s3_object" "api_content" {

  bucket = aws_s3_bucket.serverless_bucket.bucket
  key    = var.key_bucker_s3
  source = "${path.root}/example/example.zip"

  tags = merge(local.common_tags, { Name = "${local.naming_prefix}-bucket-object" })

}