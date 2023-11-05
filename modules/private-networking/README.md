# Terraform Module <img src="../resources/assets/vendor/terraform/Terraform_VerticalLogo_ColorWhite_RGB.png" width="200" align="right" />

## DigitalOcean Virtual Private Cloud

This module manages VPC networks hosted by _DigitalOcean Inc_.

---

## 🚧 Usage

```hcl

module "digitalocean_vpc" {
  source = "./modules/digitalocean-private-networking"

  name        = "vpc-dummy3"
  cidr_block  = "10.0.0.0/24"
  region_slug = "fra1"
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
