# VPC Endpoint for S3

This Terraform module creates:
- A Gateway VPC Endpoint for Amazon S3

## 🔧 Features

- Restricts access to a specific S3 bucket via the VPC endpoint
- Automatically associates the VPC endpoint with provided route tables

## 📦 Module Usage

module "s3_vpc_endpoint" {
  source = "./vpc-endpoint-s3"

  region          = "us-east-1"
  vpc_id          = "vpc-0abc123456789def0"
  route_table_ids = ["rtb-0a1b2c3d4e5f6g7h"]
  endpoint_name   = "s3-gateway-endpoint"
  s3_bucket_name  = "my-secure-bucket"

  policy_actions = [
    "s3:GetObject",
    "s3:ListBucket"
  ]
}


To give full access later, simply update policy_actions:

  policy_actions = [
    "s3:*"
  ]
