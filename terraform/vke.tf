resource "vultr_kubernetes" "asinoyu" {
  region  = "itm" # 大阪リージョン
  label   = "asinoyu"
  version = "v1.25"
}

resource "vultr_kubernetes_node_pools" "general" {
  cluster_id    = vultr_kubernetes.asinoyu.id
  node_quantity = 3
  plan          = "vc2-1c-1gb"
  label         = "general"
  tag           = "general"
  auto_scaler   = true
  min_nodes     = 1
  max_nodes     = 3
}
