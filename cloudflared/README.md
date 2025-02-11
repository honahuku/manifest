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
  --dry-run=client -o yaml > cloudflared/overlays/PIYO/secret.yaml

# argocd-stg.honahuku.dev を追加
cloudflared tunnel route dns kind-argocd-tunnel longhorn-stg
```

[#クラスタ内での secret 管理](../README.md#クラスタ内での-secret-管理) を参考に吐き出した secret を暗号化するのを忘れずに！
