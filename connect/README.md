# connect
1password Connect and Operator  
クラスタのsecret管理ツール  

## bootstrap
基本的には kustomizetion.yaml を見て ArgoCD が勝手にデプロイしてくれる  
ただ 1password operetor が secret を注入するために 1password.com にアクセスする際の secret は最初に手動でデプロイする必要がある  

```bash
kubectl create secret generic op-credentials \
-n connect \
--from-file=1password-credentials.json=1password-credentials.json \
--dry-run=client -o yaml | kubectl apply -f -

export ENCODED_TOKEN=$(echo $OP_CONNECT_TOKEN | base64 | tr -d '\n')
ENCODED_TOKEN="$ENCODED_TOKEN" yq e '.data.token = env(ENCODED_TOKEN)' onepassword-token.yaml | kubectl apply -f -

kubectl create secret generic onepassword-token \
-n connect \
--from-literal=token="$OP_CONNECT_TOKEN" --dry-run=client -o yaml | kubectl apply -f -
```

connect apiの検証
```bash
curl \
-H "Accept: application/json" \
-H "Authorization: Bearer $OP_CONNECT_TOKEN" \
http://localhost:8081/v1/vaults |jq

curl http://localhost:8081/health | jq

# 8080 ポートはargoが使ってるかもしれないので適宜8081とかを使う
```

helm で入れるとうまく動くが、argoとkustomizeで入れると動かない...
