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

  values = []
}
