output "cloudfront_id" {
  value       = data.aws_cloudfront_distribution.cloudfront.id
  sensitive   = false
  description = "value of the cloudfront id"
}

output "cloudfront_domain_name" {
  value       = data.aws_cloudfront_distribution.cloudfront.domain_name
  sensitive   = false
  description = "value of the cloudfront domain name"
}
