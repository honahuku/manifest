# Akeyless Gateway

Deploy Akeyless Gateway in the Kubernetes cluster to connect to Akeyless using external-secrets.  
Documentation:  
https://docs.akeyless.io/docs/gateway-k8s

## Creating Secrets for Gateway Usage

To connect to Akeyless, create a secret with the pre-created API's adminAccessId and adminAccessKey, and inject it into the cluster.
```bash
kubectl apply -f secret/akeyless-api-gateway-credentials.yaml -n akeyless
```