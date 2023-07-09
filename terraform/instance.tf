# itmリージョンかつvc2(クラウドコンピューティング)かつ1コアのプランを抽出
# curl "https://api.vultr.com/v2/plans" -X GET | jq '{plans: [.plans[] | select(.vcpu_count == 1 and .type == "vc2" and (.locations | index("itm"))) | del(.locations)]}' > plans.json
# OSの一覧を抽出
# curl "https://api.vultr.com/v2/os" -X GET | jq > os.json

resource "vultr_instance" "k8s_test01" {
    plan = "vc2-1c-2gb"
    region = "itm"
    os_id = 1743
    label = "k8s-test01"
    enable_ipv6 = true
    backups = "disabled"
    ddos_protection = false
    ssh_key_ids = ["${vultr_ssh_key.github.id}"]
}

resource "vultr_instance" "k8s_test02" {
    plan = "vc2-1c-2gb"
    region = "itm"
    os_id = 1743
    label = "k8s-test02"
    enable_ipv6 = true
    backups = "disabled"
    ddos_protection = false
    ssh_key_ids = ["${vultr_ssh_key.github.id}"]
}

resource "vultr_instance" "k8s_test03" {
    plan = "vc2-1c-2gb"
    region = "itm"
    os_id = 1743
    label = "k8s-test03"
    enable_ipv6 = true
    backups = "disabled"
    ddos_protection = false
    ssh_key_ids = ["${vultr_ssh_key.github.id}"]
}
