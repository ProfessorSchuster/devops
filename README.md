# 🚀 Skaffold + Kubernetes Demo

Diese Demo zeigt, wie man mit **Skaffold**, **Kind** (Kubernetes in Docker) und **NGINX** einen einfachen Webserver lokal entwickelt und automatisch in ein Kubernetes-Cluster deployed – ideal für CI/CD-Workflows.

---

## 📁 Projektstruktur

| Datei              | Zweck                                                                 |
|--------------------|-----------------------------------------------------------------------|
| `Dockerfile`       | Baut ein NGINX-Image mit einer eigenen `index.html`                  |
| `index.html`       | Die HTML-Seite, die vom Webserver angezeigt wird                     |
| `deployment.yaml`  | Erstellt den Kubernetes Deployment (Pod-Definition)                  |
| `service.yaml`     | Definiert einen Service, um den Pod im Cluster erreichbar zu machen  |
| `ingress.yaml`     | Leitet externe Anfragen auf den Service weiter (über Ingress)        |
| `kind-config.yaml` | Konfiguriert das lokale Kind-Cluster inkl. Portweiterleitung         |
| `skaffold.yaml`    | Zentrale Steuerung: Build, Deploy, Tagging, Hooking mit Skaffold     |

---

## ✅ Voraussetzungen

- Docker
- Kind (`kind create cluster`)
- kubectl
- Skaffold (`skaffold dev` / `skaffold run`)
- Optional: GitHub Container Registry (GHCR) Zugang

---

## 🚦 Schnellstart

### 1. Cluster erstellen

```bash
kind create cluster --config kind-config.yaml
kubectl label node kind-control-plane ingress-ready=true
kubectl apply -k github.com/kubernetes/ingress-nginx/deploy/static/provider/kind
```
### 2. Projekt starten
```bash
skaffold dev
```
📦 Das startet:

- Docker-Build des Images

- Deployment in Kind

- Exponierung unter: http://localhost:8080

## 💡 Was zeigt diese Demo?
Automatisches Build + Deployment mit Live-Reload (skaffold dev)

Zugriff auf den Webserver über Ingress

Logging von Button-Klicks im Terminal via NGINX-Logs

Optional: Push zu GHCR möglich

## 🧼 Aufräumen
```bash
Kopieren
Bearbeiten
skaffold delete
kind delete cluster
```
## 📦 Optional: Push zu GitHub Container Registry
Image in skaffold.yaml auf ghcr.io/<username>/<repo> setzen. Dann:

```bash
docker login ghcr.io -u <username> --password-stdin
skaffold run
```
✍️ Autor
Cedric aka ProfessorSchuster