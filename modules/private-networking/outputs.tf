output "id" {
  value       = digitalocean_vpc.detlta4x4_vpc.id
  description = "The unique ID for the newly created VPC."
}

output "urn" {
  value       = digitalocean_vpc.detlta4x4_vpc.urn
  description = "The uniform resources name for the newly created VPC."
}

output "default" {
  value       = digitalocean_vpc.detlta4x4_vpc.default
  description = "A boolean indicating whether or not the VPC is the default one for the region."
}
