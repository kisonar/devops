# Minikube

## Installation
### MacOS
brew install minikube
w razie problemow
brew unlink minikube
brew link minikube

### Linux
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube   

## Documentation
https://minikube.sigs.k8s.io/docs/

## Commands
minicube start
minikube dashboard => WEB UI
minikube stop
minikube config set memory 9001
minikube addons list
minikube delete --all
