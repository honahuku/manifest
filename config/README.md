# Configuration Files

This directory contains configuration files that cannot be placed in their respective directories.

For example, in the case of [secretstore.yaml](https://github.com/honahuku/manifest/blob/main/config/secretstore.yaml), it could not be declared with the external-secrets application and its directory, so it is placed here.

You can find more details about this issue here:
https://github.com/external-secrets/external-secrets/issues/2273

## Applying ExternalSecret

When applying the ExternalSecret located in the [externalsecret](https://github.com/honahuku/manifest/tree/main/config/externalsecret) directory, execute the following command. Change the file name as needed.

```bash
kubectl apply -f config/externalsecret/cf-argowf.yaml -n config
```