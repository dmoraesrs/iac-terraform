################################################################
#### Bucket S3 s3_skymed_storage_01
################################################################
module "s3_lab" {
  source                  = "terraform-aws-modules/s3-bucket/aws"
  create_bucket           = true
  bucket                  = "${var.environment}-${var.s3_bucket_name}"
  tags                    = merge(var.globaltags, var.s3_tags)
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}