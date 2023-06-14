resource "vultr_load_balancer" "asinoyu-lb" {
  region              = "itm"
  label               = "asinoyu-lb"
  balancing_algorithm = "roundrobin"
  ssl_redirect = true

  forwarding_rules {
    frontend_protocol = "http"
    frontend_port     = 80
    backend_protocol  = "http"
    backend_port      = 32277
  }

  forwarding_rules {
    frontend_protocol = "https"
    frontend_port     = 443
    backend_protocol  = "https"
    backend_port      = 31603
  }

  ssl {
    private_key = tls_private_key.argocd_honahuku_com.private_key_pem
    certificate = cloudflare_origin_ca_certificate.argocd_honahuku_com.certificate
  }
}
