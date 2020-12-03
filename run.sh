#!/bin/sh

# This script exists, because https://github.com/GoogleContainerTools/skaffold/issues/4641

kubectl --context minikube create -f common
sudo skaffold build --tag=latest --kube-context minikube
sudo skaffold run --tag="latest" --kube-context minikube