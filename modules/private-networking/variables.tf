variable "name" {
  type        = string
  description = "The name for the newly created DigitalOcean VPC."
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block to configure for the DigitalOcean VPC."
  default     = "10.0.0.0/24"
}

variable "region_slug" {
  type        = string
  description = "The slug for the DigitalOcean datacenter region to create the VPC in. Defaults to Frankfurt, Germany."
  default     = "fra1"
}
