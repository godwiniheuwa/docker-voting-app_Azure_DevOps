### Command to Create an ACR ImagePullSecret

To create a Docker registry secret in Kubernetes for pulling images from Azure Container Registry (ACR), use the following command:

```bash
kubectl create secret docker-registry <secret-name> \
    --namespace <namespace> \
    --docker-server=<container-registry-name>.azurecr.io \
    --docker-username=<service-principal-ID> \
    --docker-password=<service-principal-password>
