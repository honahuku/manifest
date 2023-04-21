# cloudflared

オンプレミスのk8sにデプロイされたapplicationのserviceをcloudflaredで公開するためのマニフェストです。  
cloudflaredの基本設定が`base/`に、各application用のマニフェストが`overlays/`にあります。  
これらのデプロイは[applications/base/cloudflared.yaml](https://github.com/honahuku/manifest/blob/main/cloudflared-apps/applicationset.yaml)にて管理されています。  