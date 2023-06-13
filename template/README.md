# Application Templates

This directory contains templates for applications deployed using ApplicationSets.

- Cloudflared
    - [ApplicationSet](https://github.com/honahuku/manifest/blob/main/cloudflared-apps/applicationset.yaml)
    - [Template](https://github.com/honahuku/manifest/tree/main/template/cloudflared)

Templates for secret manifests are also located here.
- Akeyless
    - [Template](https://github.com/honahuku/manifest/tree/main/template/akeyless)

```bash
kubectl apply -f secret/akeyless-api-gateway-credentials.yaml -n akeyless
kubectl apply -f secret/akeylesscreds.yaml -n akeyless
```
