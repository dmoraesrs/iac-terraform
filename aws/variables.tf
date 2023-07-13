######### GERAL
variable "environment" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "globaltags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
  default     = { "SOURCE" = "terraform", "PRODUCT" = "lab", "MANAGED" = "IAC" }
}


######### S3
variable "s3_acl" {
  description = "Specifies server-side encryption of the object in S3. Valid values are \"AES256\" and \"aws:kms\"."
  type        = string
  default     = "private"
}
variable "s3_force_destroy" {
  type    = bool
  default = true
}

variable "s3_bucket_name" {
  description = "Specifies bucket name."
  type        = string
  default     = ""
}

variable "s3_tags" {
  description = "A map of tags to assign to the object."
  type        = map(string)
  default     = {}
}