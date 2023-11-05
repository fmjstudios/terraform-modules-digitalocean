data "digitalocean_image" "ubuntu2204" {
  slug = var.image_slug
}

data "digitalocean_sizes" "do_standard_sizes" {
  filter {
    key    = "vcpus"
    values = var.vcpu_count
  }

  filter {
    key    = "regions"
    values = [var.region_slug]
  }

  filter {
    key    = "disk"
    values = [var.disk_size]
  }

  sort {
    key       = "price_monthly"
    direction = "asc"
  }
}

data "digitalocean_regions" "do_regions" {
  filter {
    key    = "available"
    values = ["true"]
  }

  filter {
    key      = "slug"
    values   = [var.region_slug]
    match_by = "exact"
  }

  sort {
    key       = "available"
    direction = "asc"
  }
}

locals {
  droplet_image      = data.digitalocean_image.ubuntu2204.id
  droplet_size       = element(data.digitalocean_sizes.do_standard_sizes.sizes, 0).slug
  region             = element(data.digitalocean_regions.do_regions.regions, 0).slug
  ssh_allowed_users  = join(" ", var.cloud_config["ssh"].allow_users)
  ssh_allowed_groups = join(" ", var.cloud_config["ssh"].allow_groups)
}

data "template_file" "cloud_config" {
  template = file("${path.module}/templates/cloud-config.tftpl")

  vars = {
    users                 = yamlencode(var.cloud_config["users"])
    enable_ssh_pwauth     = var.cloud_config["enable_ssh_pwauth"]
    pwauth_expire_passwds = var.cloud_config["pwauth_expire_passwds"]
    chpasswd_users        = indent(4, yamlencode(var.cloud_config["chpasswd_users"]))

    timezone = var.cloud_config["timezone"]
    locale   = var.cloud_config["locale"]

    preserve_hostname         = var.cloud_config["preserve_hostname"]
    hostname                  = var.cloud_config["hostname"]
    fqdn                      = var.cloud_config["fqdn"]
    prefer_fqdn_over_hostname = var.cloud_config["prefer_fqdn_over_hostname"]
    manage_etc_hosts          = var.cloud_config["manage_etc_hosts"]

    ssh_port           = var.cloud_config["ssh"].port
    ssh_listen_address = var.cloud_config["ssh"].listen_address
    ssh_log_level      = var.cloud_config["ssh"].log_level
    ssh_allow_users    = local.ssh_allowed_users
    ssh_allow_groups   = local.ssh_allowed_groups
  }
}

data "template_cloudinit_config" "cloud_config" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.cloud_config.rendered
  }
}


resource "digitalocean_droplet" "delta4x4_instance" {
  name   = var.name
  image  = local.droplet_image
  region = local.region
  size   = local.droplet_size

  backups           = var.backups
  monitoring        = var.monitoring
  ipv6              = var.ipv6
  vpc_uuid          = var.vpc_uuid
  resize_disk       = var.resize_disk
  tags              = var.tags
  volume_ids        = var.volume_ids
  droplet_agent     = var.droplet_agent
  graceful_shutdown = var.graceful_shutdown

  user_data = data.template_cloudinit_config.cloud_config.rendered
}
