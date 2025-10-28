resource "aws_iam_role_policy" "ecr_policy" {
  name = "ecr-app-permission"
  role = aws_iam_role.ecr_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "Statement1",
        "Effect" : "Allow",
        "Action" : "apprunner:*",
        "Resource" : "*"
      },
      {
        "Sid" : "Statement2",
        "Effect" : "Allow",
        "Action" : [
          "iam:PassRole",
          "iam:CreateServiceLinkedRole",
        ],
        "Resource" : "*"
      },
      {
        Sid = "Statement3"
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
