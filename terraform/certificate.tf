# Create a CSR and generate a CA certificate
resource "tls_private_key" "argocd_honahuku_com" {
  algorithm = "RSA"
}

resource "tls_cert_request" "argocd_honahuku_com" {
  private_key_pem = tls_private_key.argocd_honahuku_com.private_key_pem

  subject {
    common_name  = ""
    organization = "honahuku.com"
  }
}

resource "cloudflare_origin_ca_certificate" "argocd_honahuku_com" {
  csr                = tls_cert_request.argocd_honahuku_com.cert_request_pem
  hostnames          = ["argocd.honahuku.com"]
  request_type       = "origin-rsa"
  requested_validity = 7
}
