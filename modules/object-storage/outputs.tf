output "name" {
  value       = digitalocean_spaces_bucket.delta4x4_bucket.name
  description = "The name for the DigitalOcean Spaces bucket."
}

output "urn" {
  value       = digitalocean_spaces_bucket.delta4x4_bucket.urn
  description = "The uniform resource name for the DigitalOcean Spaces bucket."
}

output "region" {
  value       = digitalocean_spaces_bucket.delta4x4_bucket.region
  description = "The datacenter region for the DigitalOcean Spaces bucket."
}

output "bucket_domain_name" {
  value       = digitalocean_spaces_bucket.delta4x4_bucket.bucket_domain_name
  description = "The domain name for the DigitalOcean Spaces bucket."
}

output "endpoint" {
  value       = digitalocean_spaces_bucket.delta4x4_bucket.endpoint
  description = "The API endpoint for the DigitalOcean Spaces bucket."
}
