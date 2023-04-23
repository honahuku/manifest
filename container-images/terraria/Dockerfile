# ビルド用ステージ
FROM alpine as builder

ARG IMAGE_TAG="1449"

RUN apk --update-cache --no-cache add unzip
ADD https://terraria.org/api/download/pc-dedicated-server/terraria-server-${IMAGE_TAG}.zip terraria-server.zip
RUN unzip terraria-server.zip && \
    mkdir terraria && \
    mv ${IMAGE_TAG}/Linux/* terraria/ && \
    chmod +x terraria/TerrariaServer
COPY container-images/terraria/tctl terraria/

# 実行用ファイルを保存するステージ
FROM alpine
COPY --from=builder /terraria /opt/terraria
