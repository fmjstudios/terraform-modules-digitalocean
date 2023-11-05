output "ipv4" {
  value       = digitalocean_droplet.delta4x4_instance.ipv4_address
  description = "The IP configuation for the newly created Contabo instance"
}

output "pricing_monthly" {
  value       = digitalocean_droplet.delta4x4_instance.price_monthly
  description = "The monthly price for the DigitalOcean droplet."
}

output "cpus" {
  value       = digitalocean_droplet.delta4x4_instance.vpc_uuid
  description = "The vCPU count for the DigitalOcean droplet."
}

output "size" {
  value       = digitalocean_droplet.delta4x4_instance.size
  description = "The instance size for the DigitalOcean droplet."
}

output "region" {
  value       = digitalocean_droplet.delta4x4_instance.region
  description = "The datacenter region for the DigitalOcean droplet."
}

output "name" {
  value       = digitalocean_droplet.delta4x4_instance.name
  description = "The name for the newly created DigitalOcean droplet."
}
