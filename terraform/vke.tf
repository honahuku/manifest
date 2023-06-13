resource "vultr_kubernetes" "asinoyu" {
  region  = "itm" # 大阪リージョン
  label   = "asinoyu" # 芦之湯, 〒250-0523
  version = "v1.25.7+2"

  node_pools {
    node_quantity = 1
    plan          = "vc2-1c-2gb"
    label         = "general"
    auto_scaler   = true
    min_nodes     = 1
    max_nodes     = 2
  }
}
