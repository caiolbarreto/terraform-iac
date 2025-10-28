resource "aws_iam_role_policy_attachment" "app_runner_read_only_policy_attachment" {
  role       = aws_iam_role.app_runner_role.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
