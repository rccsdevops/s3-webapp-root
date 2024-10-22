# Terraform AWS Infrastructure Setup

This project contains a Terraform configuration that sets up an S3 bucket for hosting a static website.

## Table of Contents

- [Overview](#overview)
- [Resources](#resources)
- [Pre-requisites](#pre-requisites)
- [Variables](#variables)
- [Outputs](#outputs)
- [Usage](#usage)
- [Author](#author)

## Overview

This Terraform configuration provisions an S3 bucket that includes content files for a static website.

## Resources

The following AWS resources are created:
- **S3 Bucket**: An S3 bucket for hosting a static website.
- **S3 Bucket website configuration**: Configures bucket for static website hosting
- **S3 Bucket public access block**: Configures bucket's public access settings
- **S3 Bucket policy**: Grants public access to objects in the bucket
- **index.html**: The `home` page of the static website.
- **error.html**: The default `error` page for the static website.

## Pre-requisites

Ensure you have the following installed:
- [Terraform](https://www.terraform.io/downloads.html) v1.9+ (preferably the latest version).
- An AWS account with access credentials (e.g., IAM Identity Center SSO account).
- AWS CLI configured if you're importing resources or running commands manually.
- GitHub account with Admin acccess
- HCP Terraform account with Admin access

#### Follow the init/plan/apply workflow
1. Run `terraform init`.
2. Run `terraform plan`.
3. Run `terraform apply`.
4. Run `terraform destroy` to clean up resources.

## Variables

| Name           | Description                                      | Type   | Default                             |
|----------------|--------------------------------------------------|--------|-------------------------------------|
| `aws_region`   | The AWS region to deploy resources in            | string | `"us-east-1"`                       |
| `environment`  | The deployment environment                       | string | `"development"`                     |
| `config`       | Object containing configuration for child module | object | See child module README for details |

## Outputs

| Name                    | Description                                     |
|-------------------------|-------------------------------------------------|
| `website_bucket_arn`    | The ARN of the S3 bucket                        |
| `website_bucket_name`   | The name of the S3 bucket                       |
| `website_bucket_domain` | Domain name for the bucket                      |
| `website_bucket_tags`   | Tags applied to the bucket                      |
| `website_url`           | The endpoint URL for the static website on S3   |

## Usage

### Module Usage for S3 Static Site

To utilize the S3 Static Site module, use the following `module` block in the `main.tf` of the root module. The `config` object is now used to pass in the required and optional values:

```hcl
module "website-s3-bucket" {
  source = "app.terraform.io/<organization name>/s3-static-website/aws"  # required
  version = "1.0.0"   # recommended

  config = {
    bucket_name    = "<globally-unique-bucket-name>" # required
    destroy_bucket = false                           # optional
    index_suffix   = "index.html"                    # optional
    error_key      = "error.html"                    # optional
    bucket_tags = {
      key = "value"                                  # optional
    }
  }
}
```

### Deployment Steps

1. Run the following commands to set up the infrastructure:
   - `terraform init` – Initialize the configuration.
   - `terraform plan` – Review the plan and confirm configuration.
   - `terraform apply` – Apply the configuration to create resources.
2. To destroy the infrastructure:
   - `terraform destroy`.

## Author
Developed by \<Author\>. Contributions and feedback are welcome!