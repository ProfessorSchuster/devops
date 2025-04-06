skaffold dev




# 1. Code ändern (z. B. index.html)
# 2. Image neu bauen
docker build -t my-app:dev .

# 3. Image mit neuem Tag versehen (sonst kein Update)
docker tag my-app:dev registry.local/my-app:v123

# 4. In die Registry pushen
docker push registry.local/my-app:v123

# 5. Deployment YAML manuell anpassen (neues Image)
vim deployment.yaml

# 6. Neu deployen
kubectl apply -f deployment.yaml

# 7. Warten auf neuen Pod
kubectl rollout status deployment my-app

# 8. Logs checken
kubectl logs -f deployment/my-app

# 9. Manuell Port forwarden
kubectl port-forward svc/my-app 8080:80


Zweck Befehl
📦 Cluster erstellen	kind create cluster --config kind-config.yaml
🔄 Cluster löschen	kind delete cluster
📂 Ingress installieren	kubectl apply -k github.com/kubernetes/ingress-nginx/...
📛 Node für Ingress markieren	kubectl label node kind-control-plane ingress-ready=true
⏳ Warten auf Ingress	kubectl wait --namespace ingress-nginx ...
🔍 Pods anzeigen	kubectl get pods
📜 Logs anzeigen	kubectl logs -f <pod-name>
💣 Pod neu starten	kubectl delete pod <pod-name>