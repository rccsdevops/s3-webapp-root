# configure the AWS provider
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Terraform   = "true"
    }
  }
}

# module for creating a website using an s3 bucket
module "website-s3-bucket" {
  source  = "app.terraform.io/jk-demo-org/s3-static-website/aws"
  version = "1.0.0"
  config = {
    bucket_name    = var.aws_bucket_name
    destroy_bucket = true
    index_suffix   = "index.html"
    error_key      = "error.html"
    bucket_tags = {
      Owner = "development team"
    }
  }
}
