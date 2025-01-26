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

## kompose による manifest の自動生成
[kubernetes/kompose](https://github.com/kubernetes/kompose) というツールがあります。  
これは docker-compose ファイルをk8sのマニフェストに変換してくれるやつです  
