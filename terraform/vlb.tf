resource "vultr_load_balancer" "asinoyu-lb" {
  region              = "itm"
  label               = "a4511a7a7c2b7476eb6a2c83c9fbc08d"
  balancing_algorithm = "roundrobin"

  forwarding_rules {
    frontend_protocol = "http"
    frontend_port     = 80
    backend_protocol  = "http"
    backend_port      = 32277
  }

  forwarding_rules {
    frontend_protocol = "http"
    frontend_port     = 443
    backend_protocol  = "https"
    backend_port      = 31603
  }

  ssl {
    private_key = tls_private_key.argocd_honahuku_com.private_key_pem
    certificate = cloudflare_origin_ca_certificate.argocd_honahuku_com.certificate
  }
}
