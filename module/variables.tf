variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "route_table_ids" {
  description = "List of route table IDs"
  type        = list(string)
}

variable "endpoint_name" {
  description = "Tag name for the endpoint"
  type        = string
}

variable "endpoint_type" {
  description = "Type of Endpoint"
  type        = string
}

variable "Effect" {
  description = "Restrict for users"
  type        = string
}

variable "user" {
  description = "Which user needs permission"
  type        = string
}

variable "s3_bucket_name" {
  description = "Target S3 bucket name"
  type        = string
}

variable "policy_actions" {
  description = "List of S3 actions to allow (e.g., ['s3:GetObject', 's3:PutObject'])"
  type        = list(string)
}
