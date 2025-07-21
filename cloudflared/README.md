### cloudflared
参考にしたコード  
https://github.com/cloudflare/argo-tunnel-examples/tree/master/named-tunnel-k8s

```bash
# トンネルを作成
cloudflared tunnel create cointreau
# Tunnel credentials written to HOGE.json. みたいな感じでログが出るので場所をメモっておく
# linux なら ~/.cloudflared/ にあるはず

# secret の作成
kubectl create secret -n cloudflared generic cloudflared-credentials \
  --from-file=credentials.json=/home/honahuku/.cloudflared/cert.pem \
  --dry-run=client -o yaml > cloudflared/overlays/production/secret.yaml

# sops で暗号化
sops -e -i cloudflared/overlays/production/secret.yaml

# デプロイ
kustomize build --enable-alpha-plugins --enable-exec cloudflared/overlays/production | kubectl apply -f -

# argocd-stg.honahuku.dev を追加
# コネクタIDではなくトンネルIDがCNAMEレコードとして登録される
cloudflared tunnel route dns cointreau argocd
```

[#クラスタ内での secret 管理](../README.md#クラスタ内での-secret-管理) を参考に吐き出した secret を暗号化するのを忘れずに！
