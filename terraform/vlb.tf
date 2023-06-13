resource "vultr_load_balancer" "asinoyu-lb" {
  region              = "itm"
  label               = "a4511a7a7c2b7476eb6a2c83c9fbc08d"
  balancing_algorithm = "roundrobin"

  forwarding_rules {
    frontend_protocol = "tcp"
    frontend_port     = 80
    backend_protocol  = "tcp"
    backend_port      = 32277
  }

  forwarding_rules {
    frontend_protocol = "tcp"
    frontend_port     = 443
    backend_protocol  = "tcp"
    backend_port      = 31603
  }
}
