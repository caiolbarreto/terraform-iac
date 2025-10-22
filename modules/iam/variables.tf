variable "github_repository_name" {
  type        = string
  description = "value of the github repository name"
}

variable "iam_tags" {
  type        = map(string)
  default     = {}
  description = "value of the iam tags"
}
