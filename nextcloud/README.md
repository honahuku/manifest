# nextcloud
## kompose による compose.yaml からの manifest 自動生成
[kubernetes/kompose](https://github.com/kubernetes/kompose) によって compose.yaml を manifest に変換できます。  

```bash
curl -fsSL https://raw.githubusercontent.com/nextcloud/all-in-one/refs/heads/main/manual-install/latest.yml | kompose convert -f /dev/stdin
```
