variable "s3_bucket_name" {
  type        = string
  description = "value of the bucket name"
}

variable "s3_tags" {
  type        = map(string)
  default     = {}
  description = "value of the s3 tags"
}
