variable "name" {
  description = "Name used for the VPC and its subnets."
  type        = string
}

variable "cidr_block" {
  description = "IPv4 CIDR assigned to the VPC."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.cidr_block))
    error_message = "cidr_block must be a valid IPv4 CIDR."
  }
}

variable "availability_zones" {
  description = "Availability zones in which to place sample subnets."
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) >= 2
    error_message = "Provide at least two availability zones."
  }
}

variable "tags" {
  description = "Tags added to every resource."
  type        = map(string)
  default     = {}
}
