output "ecr_role_arn" {
  description = "ARN of the ECR role"
  value       = aws_iam_role.ecr_role.arn
}

output "ecr_role_name" {
  description = "Name of the ECR role"
  value       = aws_iam_role.ecr_role.name
}

output "app_runner_role_arn" {
  description = "ARN of the App Runner role"
  value       = aws_iam_role.app_runner_role.arn
}

output "app_runner_role_name" {
  description = "Name of the App Runner role"
  value       = aws_iam_role.app_runner_role.name
}

output "oidc_provider_arn" {
  description = "ARN of the OIDC provider"
  value       = aws_iam_openid_connect_provider.oidc-git.arn
}

output "oidc_provider_url" {
  description = "URL of the OIDC provider"
  value       = aws_iam_openid_connect_provider.oidc-git.url
}
