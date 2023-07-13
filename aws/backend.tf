# Gravação do state no S3
terraform {
  backend "s3" {
    bucket         = "labstatecm01"
    key            = "tfstate"
    region         = "us-east-1"
  }
}


