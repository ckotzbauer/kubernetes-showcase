#!/bin/bash
set -e

kind create cluster --name nw-kubernetes --config /nw-kubernetes/config/kind-config.yaml

docker network create nw-kubernetes
docker network connect nw-kubernetes nw-kubernetes-control-plane
docker network connect nw-kubernetes nw-cluster-cli

kubectl config --kubeconfig=/root/.kube/config set-cluster kind-nw-kubernetes --server=https://nw-kubernetes-control-plane:6443
