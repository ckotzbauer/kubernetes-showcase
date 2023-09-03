#!/bin/bash

docker run \
    -it \
    --name nw-cluster-cli \
    --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    ghcr.io/ckotzbauer/kubernetes-showcase/cluster:latest \
    bash
