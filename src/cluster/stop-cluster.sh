#/bin/bash
set -e

docker network disconnect nw-kubernetes nw-kubernetes-control-plane
docker network disconnect nw-kubernetes nw-cluster-cli
docker network rm nw-kubernetes

kind delete cluster --name nw-kubernetes
