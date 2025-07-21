### クラスタ内での secret 管理
[age-keygen](https://github.com/FiloSottile/age) コマンドで作った鍵を元に [sops](https://github.com/getsops/sops) で暗号化、複合をします。  
 `kustomize build` するときは [kustomize-sops](https://github.com/viaduct-ai/kustomize-sops) という kustomize のプラグイン経由で sops を実行します

```bash
# 鍵生成
# この後使う sops はデフォルトで ~/.config/sops/age/keys.txt を見に行くのでそこに生成しておく
mkdir -p ~/.config/sops/age/ && age-keygen -o ~/.config/sops/age/keys.txt

# クラスタにsecret複合用の鍵を登録する
# keys.txt は 1password に入ってる
# https://start.1password.com/open/i?a=EC5HVUOHBBBOLBQCBEEVSW6LJU&v=v4ueg2kz36ud4vc6taajlse7n4&i=jgcghltepo5xdtjbhh2qcgsewa&h=my.1password.com
kubectl create secret generic sops-age-key -n argocd --from-file=keys.txt

# secret の暗号化
sops -e -i cloudflared/overlays/production/secret.yaml

sops -e cloudflared/overlays/production/secret.yaml > cloudflared/overlays/production/secret.enc.yaml

# secret の複合
sops -d -i cloudflared/overlays/production/secret.yaml
```
