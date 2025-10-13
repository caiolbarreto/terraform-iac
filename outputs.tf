output "s3_bucket_name" {
  value       = module.s3.bucket_domain_name
  sensitive   = false
  description = "value of the s3 bucket name"
}

output "cloudfront_domain_name" {
  value       = module.cloudfront.cloudfront_domain_name
  sensitive   = false
  description = "value of the cloudfront domain name"
}
