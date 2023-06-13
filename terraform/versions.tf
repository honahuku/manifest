terraform {
  required_version = "~> 1.5"
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "~> 2.15"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.10"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.21"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.7"
    }
  }

  backend "remote" {
    organization = "honahuku"
    workspaces {
      name = "manifest"
    }
  }
}

provider "vultr" {
  api_key     = var.VULTR_API_KEY
  rate_limit  = 1300
  retry_limit = 6
}

provider "kubernetes" {
  host                   = local.k8s_endpoint_asinoyu
  cluster_ca_certificate = local.k8s_cluster_ca_certificate_asinoyu
  client_certificate     = local.k8s_client_certificate_asinoyu
  client_key             = local.k8s_client_key_asinoyu
}

provider "helm" {
  kubernetes {
    host                   = local.k8s_endpoint_asinoyu
    cluster_ca_certificate = local.k8s_cluster_ca_certificate_asinoyu
    client_certificate     = local.k8s_client_certificate_asinoyu
    client_key             = local.k8s_client_key_asinoyu
  }
}

provider "cloudflare" {
  api_token = var.CF_API_TOKEN
}
