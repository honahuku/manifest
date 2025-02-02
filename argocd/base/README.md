# argocd/base
memo: repo-secrets.yaml を追加しないと
```text
Unable to connect HTTPS repository: error testing repository connectivity: Get "https://github.com/honahuku/manifest.git/info/refs?service=git-upload-pack": dial tcp: lookup github.com on 10.96.0.10:53: server misbehaving
```
と怒られるので https で repo url だけが書かれた secrets を追加しておく
