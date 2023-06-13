provider "vultr" {
  required_version = ">= 0.13"
  required_providers {
    vultr = {
      source      = "vultr/vultr"
      version     = "2.15.1"
      api_key     = var.VULTR_API_KEY
      rate_limit  = 100
      retry_limit = 3
    }
  }
}
