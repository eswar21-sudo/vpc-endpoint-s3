module "s3" {
  source      = "../modules/s3"
  bucket_name = "spacelift-consumer-s3-bucket"
}

output "bucket_name" {
  value = module.s3.bucket_name
}