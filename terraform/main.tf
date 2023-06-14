variable "VULTR_API_KEY" {
  description = "[SENSITIVE]vultrに接続するために使うAPIキー"
  type        = string
}

variable "CF_ACCOUNT_ID" {
  description = "cfのアカウントID"
  type        = string
}

variable "CF_API_TOKEN" {
  description = "[SENSITIVE]cfに接続するために使うAPI token"
  type        = string
}

# output "certificate" {
#   value = cloudflare_origin_ca_certificate.argocd_honahuku_com.certificate
# }

# output "pem" {
#   value = nonsensitive(tls_private_key.argocd_honahuku_com.private_key_pem)
# }
