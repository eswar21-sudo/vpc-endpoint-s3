provider "aws" {
 region = var.region
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = var.endpoint_type
  route_table_ids   = var.route_table_ids

  tags = {
    Name = var.endpoint_name
  }



policy = jsonencode({
   Version = "2012-10-17",
   Statement = [
     {
        Effect = var.Effect,
        Principal = {
          AWS = var.user
        },
        Action = var.policy_actions,
        Resource = [
           "arn:aws:s3:::${var.s3_bucket_name}"
         ]
     }
  ]
})
}                                                          

