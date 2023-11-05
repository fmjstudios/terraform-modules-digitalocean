variable "name" {
  type        = string
  description = "The name for the newly created DigitalOcean Spaces bucket."
}

variable "region_slug" {
  type        = string
  description = "The slug for the DigitalOcean datacenter region."
  default     = "fra1"
}

variable "lifecycle_rules" {
  type        = any
  description = "The lifecycle rule definition to be applied to the newly created DigitalOcean Spaces bucket."
  default     = {}
}

variable "acl" {
  type        = string
  description = "The ACL rule for the newly created DigitalOcean Spaces bucket."
  default     = "public-read"
}

variable "versioning" {
  type        = bool
  description = "Whether or not to enable versioning for the newly created DigitalOcean Spaces bucket."
  default     = false
}

variable "cors_rules" {
  type        = any
  description = "The CORS rule definition to be applied to the newly created DigitalOcean Spaces bucket."
  default     = {}
}

variable "policy_config" {
  type        = any
  description = "The policy configuration in order to render the template correctly."
  default     = {}
}
