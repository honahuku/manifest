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
