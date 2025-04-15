module "s3_vpc_endpoint" {
  source = "./vpc-endpoint-s3"

  region          = "us-east-1"
  vpc_id          = "vpc-123456"
  route_table_ids = ["rtb-aaa", "rtb-bbb"]
  endpoint_name   = "s3-endpoint"
  iam_user_name   = "s3-user"
  s3_bucket_name  = "my-bucket"

  policy_actions = [
    "s3:GetObject",
    "s3:ListBucket"
  ]
}
