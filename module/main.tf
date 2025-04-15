provider "aws" {
 region = var.region

}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.route_table_ids

  tags = {
    Name = var.endpoint_name
  }
}

resource "aws_iam_user" "custom_user" {
  name = var.iam_user_name
}

resource "aws_iam_policy" "custom_s3_policy" {
  name        = "${var.iam_user_name}-s3-policy"
  description = "Custom S3 access via VPC endpoint"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = var.policy_actions,
        Resource = [
          "arn:aws:s3:::${var.s3_bucket_name}",
          "arn:aws:s3:::${var.s3_bucket_name}/*"
        ],
        Condition = {
          StringEquals = {
            "aws:SourceVpce" = aws_vpc_endpoint.s3.id
          }
        }
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_policy" {
  user       = aws_iam_user.custom_user.name
  policy_arn = aws_iam_policy.custom_s3_policy.arn
}
