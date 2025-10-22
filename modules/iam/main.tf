resource "aws_iam_openid_connect_provider" "oidc-git" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]

  tags = {
    Iac = true
  }
}

resource "aws_iam_role" "ecr_role" {
  name = "ecr-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Principal" : {
          "Federated" : "arn:aws:iam::629108221444:oidc-provider/token.actions.githubusercontent.com"
        },
        "Condition" : {
          "StringEquals" : {
            "token.actions.githubusercontent.com:aud" : [
              "sts.amazonaws.com"
            ]
          },
          "StringLike" : {
            "token.actions.githubusercontent.com:sub" : [
              "repo:${var.github_repository_name}:ref:refs/heads/main",
              "repo:${var.github_repository_name}:ref:refs/heads/main"
            ]
          }
        }
      }
    ]
  })

  tags = var.iam_tags
}

resource "aws_iam_role_policy" "ecr_policy" {
  name = "ecr-app-permission"
  role = aws_iam_role.ecr_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "Statement1"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchCheckLayerAvailability",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}
