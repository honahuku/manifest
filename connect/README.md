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

kubectl create secret generic onepassword-token -n connect \
--from-literal=token="OP_CONNECT_TOKEN" | kubectl apply -f -
```

