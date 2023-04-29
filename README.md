# manifest
This repository contains Kubernetes manifest files and Docker configuration files.

## Overview
### Kubernetes Manifest Files
This repository includes manifest files for deploying applications on a Kubernetes cluster.

### Docker Configuration Files
This includes the Dockerfile and other files related to building and configuring container images.
[container-images](https://github.com/honahuku/manifest/tree/main/container-images)

### Deployed with ArgoCD
The applications in this repository are deployed using [ArgoCD](https://github.com/argoproj/argo-cd/).

### Secrets Management
[External Secrets](https://github.com/external-secrets/external-secrets/) is used for managing secrets.  
  
[Secrets](https://github.com/honahuku/manifest/tree/main/config/externalsecret)  

### Cluster Initialization
The initial setup of the cluster is done using the bootstrap file and the files in the root directory.  
[bootstrap.yaml](https://github.com/honahuku/manifest/blob/main/bootstrap.yaml)  
[root](https://github.com/honahuku/manifest/tree/main/root)  

## Prerequisites
The following tools must be installed in order to proceed with development.  
- [kubectl](https://kubernetes.io/docs/tasks/tools/)  
- [kustomize](https://github.com/kubernetes-sigs/kustomize)  

## Usage
1. Clone the repository.
```bash
git clone https://github.com/username/repository-name.git
```
2. Apply the Kubernetes manifest files.

```bash
kustomize build `directory` | kubectl apply -f -
```

Feel free to modify the content as needed.