# manifest
This repository contains manifest files and config files for each application that will be deployed to Honahuku's home k8s cluster.

## bootstrap
ArgoCDはすでに立ち上がっているとして、以下を実行  
```bash
kustomize build argocd/overlays/production/ | kubectl apply -f -
kustomize build applications/overlays/production/ | kubectl apply -f -

# argocd の初期パスワード取得
argocd admin initial-password -n argocd
```

## kind による検証環境構築
```bash
kind create cluster

# 壊れたら
kind delete cluster
```

## k0sctl によるクラスタ設定の反映
```bash
k0sctl apply --config k0sctl.yaml
k0sctl kubeconfig > kubeconfig
```

### reset
https://docs.k0sproject.io/head/reset/
