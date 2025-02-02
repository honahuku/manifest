# nextcloud
## kompose による compose.yaml からの manifest 自動生成
[kubernetes/kompose](https://github.com/kubernetes/kompose) によって compose.yaml を manifest に変換できます。  

```bash
curl -fsSL https://github.com/nextcloud/all-in-one/raw/main/compose.yaml | kompose convert -f /dev/stdin
```
