resource "cloudflare_zone" "honahuku_com" {
  account_id = local.cf_account_id
  zone       = "honahuku.com"
}
