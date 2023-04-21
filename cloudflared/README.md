# cloudflared

オンプレミスのk8sにデプロイされたapplicationのserviceをcloudflaredで公開するためのマニフェストです。  
cloudflaredの基本設定が`base/`に、各application用のマニフェストが`overlays/`にあります。  
これらのデプロイは[applications/base/cloudflared.yaml](https://github.com/honahuku/manifest/blob/main/applications/base/cloudflared.yaml)にて管理されています。