# manifest
This repository contains manifest files and config files for each application that will be deployed to Honahuku's home k8s cluster.

## 本番クラスタ
### bootstrap
ArgoCDはすでに立ち上がっているとして、以下を実行  
```bash
kustomize build argocd/overlays/production/ | kubectl apply -f -
kustomize build applications/overlays/production/ | kubectl apply -f -

# argocd の初期パスワード取得
argocd admin initial-password -n argocd
```
### クラスタ内での secret 管理
[age-keygen](https://github.com/FiloSottile/age) コマンドで作った鍵を元に [sops](https://github.com/viaduct-ai/kustomize-sops) で暗号化、複合をします。  
 `kustomize build` するときは [kustomize-sops](https://github.com/viaduct-ai/kustomize-sops) という kustomize のプラグイン経由で sops を実行します

```bash
# 鍵生成
# この後使う sops はデフォルトで ~/.config/sops/age/keys.txt を見に行くのでそこに生成しておく
age-keygen -o ~/.config/sops/age/

# クラスタにsecret複合用の鍵を登録する
# keys.txt は 1password に入ってるはず
kubectl create secret generic sops-age-key -n argocd --from-file=/home/HOGE_USERNAME/.config/sops/age/keys.txt

# secret の暗号化
sops -e -i cloudflared/overlays/PIYO/secret.yaml

# secret の複合
sops -d -i cloudflared/overlays/PIYO/secret.yaml
```


### k0sctl によるクラスタ設定の反映
```bash
k0sctl apply --config k0sctl.yaml
k0sctl kubeconfig > kubeconfig
```

#### reset
https://docs.k0sproject.io/head/reset/

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
