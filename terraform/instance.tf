# itmリージョンかつvc2(クラウドコンピューティング)かつ1コアのプランを抽出
# curl "https://api.vultr.com/v2/plans" -X GET | jq '{plans: [.plans[] | select(.vcpu_count == 1 and .type == "vc2" and (.locations | index("itm"))) | del(.locations)]}' > plans.json
# OSの一覧を抽出
# curl "https://api.vultr.com/v2/os" -X GET | jq > os.json

locals {
  instance_k8s_test26 = "k8s_test26"
  instance_k8s_test27 = "k8s_test27"
  instance_k8s_test28 = "k8s_test28"
}

resource "vultr_instance" "k8s_test26" {
  plan            = "vc2-1c-2gb"
  region          = "itm"
  os_id           = 1743
  label           = local.instance_k8s_test26
  hostname        = replace(local.instance_k8s_test26, "_", "-")
  enable_ipv6     = true
  backups         = "disabled"
  ddos_protection = false
  ssh_key_ids     = ["${vultr_ssh_key.github.id}"]
}

resource "vultr_instance" "k8s_test27" {
  plan            = "vc2-1c-2gb"
  region          = "itm"
  os_id           = 1743
  label           = local.instance_k8s_test27
  hostname        = replace(local.instance_k8s_test27, "_", "-")
  enable_ipv6     = true
  backups         = "disabled"
  ddos_protection = false
  ssh_key_ids     = ["${vultr_ssh_key.github.id}"]
}

resource "vultr_instance" "k8s_test28" {
  plan            = "vc2-1c-2gb"
  region          = "itm"
  os_id           = 1743
  label           = local.instance_k8s_test28
  hostname        = replace(local.instance_k8s_test28, "_", "-")
  enable_ipv6     = true
  backups         = "disabled"
  ddos_protection = false
  ssh_key_ids     = ["${vultr_ssh_key.github.id}"]
}
