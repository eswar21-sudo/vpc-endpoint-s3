output "vpc_endpoint_id" {
  value = aws_vpc_endpoint.s3.id
}

output "iam_user" {
  value = aws_iam_user.custom_user.name
}

output "policy_arn" {
  value = aws_iam_policy.custom_s3_policy.arn
}
