# Terraform Module <img src="../resources/assets/vendor/terraform/Terraform_VerticalLogo_ColorWhite_RGB.png" width="200" align="right" />

## DigitalOcean Object Storage

This module manages object storage buckets hosted by _DigitalOcean Inc_.

---

## 🚧 Usage

```hcl

module "digitalocean_bucket" {
  source = "./modules/digitalocean-object-storage"

  name        = "changeme"
  region_slug = "fra1"
  acl         = "public-read"
  versioning  = false

  policy_config = {
    ips = ["147.78.126.74/32", "84.160.114.143/32"]
  }
}

```

---

### 📜 License

**[Proprietary](./LICENSE)**

### ✉ Contact

- **Admin**: Maximilian Gindorfer
- **E-Mail**: [maximilian.gindorfer@delta4x4.com](mailto:maximilian.gindorfer@delta4x4.com)
- **Mobile**: +49 8134 93020

### © Copyright

_Assets provided by:_ **[Design Barn Inc.](https://iconscout.com)**
