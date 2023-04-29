# ArgoCD

This repository contains the manifest files for deploying ArgoCD.

To see the specified applications, please refer to the [application.yaml](https://github.com/honahuku/manifest/blob/main/root/application.yaml) file in the main repository.

## ArgoCD Deployment Management
The deployment of ArgoCD itself is also managed by ArgoCD, and using Terraform for this purpose is under consideration.
## High Availability
ArgoCD is installed with High Availability (HA) enabled.

## Patches
A patch is applied to the ConfigMap to provide the necessary parameters during ArgoCD startup.
