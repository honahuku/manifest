# Cloudflared
This directory contains the manifest files for applications deployed with Cloudflared.

- The configuration for each application is generated using an ApplicationSet, which is a template for creating applications.
- The templates for applications created by the ApplicationSet can be found in the [template/cloudflared](https://github.com/honahuku/manifest/tree/main/template/cloudflared) directory.

## command
```bash
cloudflared tunnel create kubeshark
cloudflared tunnel route dns kubeshark kubeshark.honahuku.com
```