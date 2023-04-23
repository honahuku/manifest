# terrariaのimage置き場

## コマンドメモ
```sh
docker image build --progress=plain -t terraria -f container-images/terraria/Dockerfile .
docker run -it terraria
docker tag 01dc1d7e7946 ghcr.io/honahuku/apps/terraria:1449
docker push ghcr.io/honahuku/apps/terraria:1449
```