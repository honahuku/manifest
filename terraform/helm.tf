resource "helm_release" "argocd" {
  depends_on = [kubernetes_namespace.argocd]

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  name       = "argocd"
  namespace  = "argocd"
  version    = "5.36.1"

  reset_values    = true
  recreate_pods   = true
  cleanup_on_fail = true

  values = [
    # terraform working directory からの相対パス
    # ref: https://github.com/GiganticMinecraft/seichi_infra/blob/main/terraform/onp_cluster_argocd.tf
    file("./config/argocd-helm-chart-values.yaml")
  ]
}

resource "helm_release" "argocd_apps" {
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  name       = "argocd-apps"
  namespace  = "argocd"
  version    = "1.2.0"

  reset_values    = true
  recreate_pods   = true
  cleanup_on_fail = true

  values = [
    # terraform working directory からの相対パス
    file("./config/argocd-apps-helm-chart-values.yaml")
  ]
}
