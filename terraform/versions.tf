terraform {
  required_version = ">= 1.3"
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "~> 2.15"
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
