variable "name" {
  type        = string
  description = "The name for the newly created DigitalOcean droplet."
}

variable "image_slug" {
  type        = string
  description = "The slug for the DigitalOcean OS image."
  default     = "ubuntu-22-04-x64"
}

variable "region_slug" {
  type        = string
  description = "The slug for the DigitalOcean datacenter region."
  default     = "fra1"
}

variable "vcpu_count" {
  type        = list(number)
  description = "The vCPU count to use for the DigitalOcean Droplet."
  default     = [4, 8]
}

variable "disk_size" {
  type        = number
  description = "The disk size for the DigitalOcean Droplet."
  default     = 160
}

variable "ipv6" {
  type        = bool
  description = "Whether or not to enable IPv6 for the DigitalOcean droplet."
  default     = false
}

variable "vpc_uuid" {
  type        = string
  description = "The ID of the DigitalOcean Virtual Private Cloud where the droplet will be located."
  default     = null
}

variable "resize_disk" {
  type        = bool
  description = "Whether or not to increase the disk size when resizing a Droplet."
  default     = true
}

variable "tags" {
  type        = list(string)
  description = "A list of tags to apply to the new DigitalOcean Droplet."
  default     = []
}

variable "volume_ids" {
  type        = list(string)
  description = "A list of volume IDs to apply to the new DigitalOcean Droplet."
  default     = []
}

variable "backups" {
  type        = bool
  description = "Whether or not to enable the DigitalOcean's automatic backups."
  default     = false
}

variable "monitoring" {
  type        = bool
  description = "Whether or not to enable the DigitalOcean monitoring agent."
  default     = false
}

variable "droplet_agent" {
  type        = bool
  description = "Whether or not to enable the DigitalOcean agent used for providing access in the Droplet web console."
  default     = false
}

variable "graceful_shutdown" {
  type        = bool
  description = "Whether or not to shutdown the machine gracefully before it is deleted."
  default     = true
}

variable "cloud_config" {
  type        = any
  description = "Values for rendering of a Cloud-init template file."
  default     = {}
}
