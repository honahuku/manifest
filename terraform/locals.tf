locals {
  k8s_endpoint_asinoyu = "https://${vultr_kubernetes.asinoyu.endpoint}:6443"
}

locals {
  k8s_cluster_ca_certificate_asinoyu = base64decode(vultr_kubernetes.asinoyu.cluster_ca_certificate)
}

locals {
  k8s_client_certificate_asinoyu = base64decode(vultr_kubernetes.asinoyu.client_certificate)
}

locals {
  k8s_client_key_asinoyu = base64decode(vultr_kubernetes.asinoyu.client_key)
}

locals {
  cf_account_id = var.CF_ACCOUNT_ID
}
