module "s3_vpc_endpoint" {
  source = "./module"
  region          = "us-east-1"
  endpoint_type   = "Gateway"
  vpc_id          = "vpc-0f355ea50c7c78ae4"
  route_table_ids = ["rtb-030823b8d0b41c576"]
  endpoint_name   = "s3-endpoint"
  user            = "*"
  Effect          = "Allow"
  s3_bucket_name  = "keswar01"
  policy_actions = [
    "s3:GetObject",
    "s3:ListBucket"
  ]
}
