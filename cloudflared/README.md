### cloudflared
参考にしたコード  
https://github.com/cloudflare/argo-tunnel-examples/tree/master/named-tunnel-k8s

```bash
# トンネルを作成
cloudflared tunnel create kind-argocd-tunnel
# Tunnel credentials written to HOGE.json. みたいな感じでログが出るので場所をメモっておく
# linux なら ~/.cloudflared/ にあるはず

kubectl create secret -n cloudflared generic argocd-tunnel-credentials \
  --from-file=credentials.json=HOGE.json \
  --dry-run=client -o yaml > cloudflared/overlays/development/secret.yaml

# argocd-stg.honahuku.dev を追加
cloudflared tunnel route dns kind-argocd-tunnel longhorn-stg
```

### secret のコミットについて
```bash
# 暗号化
sops -e -i cloudflared/overlays/development/secret.yaml

# 複合
sops -d -i cloudflared/overlays/development/secret.yaml
```
