variable "bucket_name" {
  description = "Globally unique S3 bucket name."
  type        = string
}

variable "tags" {
  description = "Tags added to every resource."
  type        = map(string)
  default     = {}
}
