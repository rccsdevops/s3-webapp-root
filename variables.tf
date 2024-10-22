variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "aws_bucket_name" {
  description = "a globally unique bucket name"
  type        = string
}

variable "environment" {
  description = "The deployment environment"
  type        = string
  default     = "development"
}

