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
              "repo:${var.api_cicd_github_repository_name}:ref:refs/heads/main",
              "repo:${var.api_cicd_github_repository_name}:ref:refs/heads/main"
            ]
          }
        }
      }
    ]
  })

  tags = var.iam_tags
}

resource "aws_iam_role" "app_runner_role" {
  name = "app-runner-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Sid" : "Statement1",
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "build.apprunner.amazonaws.com"
        }
      }
    ]
  })

  tags = var.iam_tags
}

resource "aws_iam_role" "tf_role" {
  name = "tf-role"
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
              "repo:${var.terraform_github_repository_name}:ref:refs/heads/main",
              "repo:${var.terraform_github_repository_name}:ref:refs/heads/main"
            ]
          }
        }
      }
    ]
  })

  tags = var.iam_tags
}
