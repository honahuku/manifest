resource "cloudflare_record" "a_terraria_honahuku_com" {
  name    = "terraria"
  proxied = false
  type    = "A"
  value   = "45.32.13.17"
  zone_id = cloudflare_zone.honahuku_com.id
}

# resource "cloudflare_record" "a_argocd_honahuku_com" {
#   name    = "argocd"
#   proxied = true
#   type    = "A"
#   value   = vultr_load_balancer.asinoyu-lb.ipv4
#   zone_id = cloudflare_zone.honahuku_com.id
# }

resource "cloudflare_record" "cname_diary_honahuku_com" {
  name    = "diary"
  proxied = true
  type    = "CNAME"
  value   = "diary-honahuku.pages.dev"
  zone_id = cloudflare_zone.honahuku_com.id
}

resource "cloudflare_record" "cname_gray_honahuku_com" {
  name    = "gray"
  proxied = true
  type    = "CNAME"
  value   = "gray-side.pages.dev"
  zone_id = cloudflare_zone.honahuku_com.id
}

resource "cloudflare_record" "cname_honahuku_com" {
  name    = "honahuku.com"
  proxied = true
  type    = "CNAME"
  value   = "www.honahuku.com"
  zone_id = cloudflare_zone.honahuku_com.id
}

resource "cloudflare_record" "cname_www_honahuku_com" {
  name    = "www"
  proxied = true
  type    = "CNAME"
  value   = "site-honahuku.pages.dev"
  zone_id = cloudflare_zone.honahuku_com.id
}

resource "cloudflare_record" "mx_honahuku_com" {
  name     = "honahuku.com"
  priority = 1
  proxied  = false
  type     = "MX"
  value    = "aspmx.l.google.com"
  zone_id  = cloudflare_zone.honahuku_com.id
}

resource "cloudflare_record" "mx_alt1_honahuku_com" {
  name     = "honahuku.com"
  priority = 5
  proxied  = false
  type     = "MX"
  value    = "alt1.aspmx.l.google.com"
  zone_id  = cloudflare_zone.honahuku_com.id
}

resource "cloudflare_record" "mx_alt2_honahuku_com" {
  name     = "honahuku.com"
  priority = 5
  proxied  = false
  type     = "MX"
  value    = "alt2.aspmx.l.google.com"
  zone_id  = cloudflare_zone.honahuku_com.id
}

resource "cloudflare_record" "mx_alt3_honahuku_com" {
  name     = "honahuku.com"
  priority = 10
  proxied  = false
  type     = "MX"
  value    = "alt3.aspmx.l.google.com"
  zone_id  = cloudflare_zone.honahuku_com.id
}

resource "cloudflare_record" "mx_alt4_honahuku_com" {
  name     = "honahuku.com"
  priority = 10
  proxied  = false
  type     = "MX"
  value    = "alt4.aspmx.l.google.com"
  zone_id  = cloudflare_zone.honahuku_com.id
}

resource "cloudflare_record" "txt_site_verification_honahuku_com" {
  name    = "honahuku.com"
  proxied = false
  type    = "TXT"
  value   = "google-site-verification=YQO7Zxe00jg8enghjNsb_5xFDFJQdBOkkHwI0s1dxLY"
  zone_id = cloudflare_zone.honahuku_com.id
}
