resource "digitalocean_vpc" "detlta4x4_vpc" {
  name   = var.name
  region = var.region_slug

  ip_range = var.cidr_block
}
