# url-redirector

## コマンドメモ
```sh
docker build -t asia.gcr.io/GCPのプロジェクト名/url-redirector:latest container-images/url-redirector/
docker run -d --rm --name nginx asia.gcr.io/GCPのプロジェクト名/url-redirector:latest
docker exec -it nginx ash
docker stop nginx
docker push ghcr.io/honahuku/apps/url-redirector:latest
```

## デプロイ先
