# connect docker to github via ssh
echo <token> | docker login ghcr.io -u <github-user-name> --password-stdin

# init git (go to the root of the project)
git init
git add .
git commit -m "Initial commit"
git branch -M main
git push -u origin main

# install kind
brew install kind
# install kubectl
brew install kubectl
# install skaffold
brew install skaffold

# Delete current cluster
kind delete cluster

# Create a new cluster
kind create cluster --config kind-config.yaml

# Install Ingress
kubectl apply -k github.com/kubernetes/ingress-nginx/deploy/static/provider/kind
kubectl label node kind-control-plane ingress-ready=true

# Check for clusters
kind get clusters

# Check for nodes
kubectl get nodes

# Check for pods
kubectl get pods --all-namespaces

# Check for services
kubectl get services --all-namespaces

# Check for deployments
kubectl get deployments --all-namespaces

# Check for ingress
kubectl get ingress --all-namespaces

# Skaffold usage
skaffold dev
skaffold run
skaffold delete
skaffold build
skaffold deploy

# Set pod amount to 2
kubectl scale deployment skaffold-demo --replicas=2
# Check for pods
kubectl get pods --all-namespaces
# Delete one pod
kubectl delete pod skaffold-demo-...
# Check for pods
kubectl get pods --all-namespaces