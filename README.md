# manifest
This repository contains manifest files and config files for each application that will be deployed to Honahuku's home k8s cluster.

## bootstrap
ArgoCDはすでに立ち上がっているとして、以下を実行  
```bash
kustomize build applications/overlays/production
```

## kompose による manifest の自動生成
[kubernetes/kompose](https://github.com/kubernetes/kompose) というツールがあります。  
これは docker-compose ファイルをk8sのマニフェストに変換してくれるやつです  
