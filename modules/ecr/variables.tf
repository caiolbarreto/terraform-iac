variable "ecr_repository_name" {
  type        = string
  description = "value of the ecr repository name"
}

variable "ecr_tags" {
  type        = map(string)
  default     = {}
  description = "value of the ecr tags"
}
