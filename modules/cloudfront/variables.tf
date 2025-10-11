variable "origin_id" {
  type        = string
  description = "value of the origin id"
}

variable "bucket_domain_name" {
  type        = string
  description = "value of the bucket domain name"
}

variable "price_class" {
  type        = string
  default     = "PriceClass_200"
  description = "value of the price class"
}

variable "cdn_tags" {
  type        = map(string)
  default     = {}
  description = "value of the cdn tags"
}
