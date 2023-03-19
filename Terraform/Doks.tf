variable "do_token" {}

terraform {
  required_providers {
    digitalocean = {
        source = "digitalocean/digitalocean"
        version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
    token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "terraform-cluster" {
    name = "terraform-cluster"
    region = "nyc1"
    version = "1.25.4-do.0"

    node_pool {
    name       = "ugochidevops"
    size       = "s-2vcpu-2gb"
    node_count = 3
    }
}