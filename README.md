# manifest
This repository contains manifest files and config files for each application that will be deployed to Honahuku's home k8s cluster.

## 本番クラスタ
### bootstrap
[honahuku/cointreau: ほなふく家クラスタの internal な設定たち](https://github.com/honahuku/cointreau) を参考に node が Ready になるところまで実施する

その後以下を実行
```bash
kustomize build argocd/overlays/production/ | kubectl apply -f -
kustomize build applications/overlays/production/ | kubectl apply -f -

# argocd の初期パスワード取得
argocd admin initial-password -n argocd
```

## stg クラスタ

### kind による検証環境構築
```bash
kind create cluster

# 壊れたら
kind delete cluster
```

### argocd の stg 向け手動デプロイ
```bash
kustomize build argocd/overlays/development/ | kubectl apply -f -
kustomize build applications/overlays/development/ | kubectl apply -f -

# argocd の初期パスワード取得
argocd admin initial-password -n argocd
```
