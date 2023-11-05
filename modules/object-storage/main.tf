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
  bucket_name = var.name
  region_id   = var.region_slug

  policy_ips = var.policy_config["ips"]
}

locals {
  json_policy_ips = jsonencode(local.policy_ips)
}

resource "digitalocean_spaces_bucket_policy" "policy_config" {
  region = local.region_id
  bucket = digitalocean_spaces_bucket.delta4x4_bucket.name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "IPAllow",
        "Effect" : "Deny",
        "Principal" : "*",
        "Action" : "s3:*",
        "Resource" : [
          "arn:aws:s3:::${digitalocean_spaces_bucket.delta4x4_bucket.name}}",
          "arn:aws:s3:::${digitalocean_spaces_bucket.delta4x4_bucket.name}/*"
        ],
        "Condition" : {
          "NotIpAddress" : {
            "aws:SourceIp" : "${local.json_policy_ips}"
          }
        }
      }
    ]
  })
}


resource "digitalocean_spaces_bucket" "delta4x4_bucket" {
  name   = local.bucket_name
  region = local.region_id

  dynamic "cors_rule" {
    for_each = var.cors_rules

    content {
      allowed_headers = try(cors_rule["allowed_headers"], null)
      allowed_methods = try(cors_rule["allowed_methods"], null)
      allowed_origins = try(cors_rule["allowed_origins"], null)
      max_age_seconds = try(cors_rule["max_age_seconds"], null)
    }
  }

  versioning {
    enabled = var.versioning
  }
}
