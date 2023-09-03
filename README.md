# Kubernetes showcase

## Prerequisites

- WSL2 with a linux distribution installed (only for Windows)
- Docker-Installation, see [official docs](https://docs.docker.com/get-docker/) for Linux, Mac (Intel and M1) or Windows.
- Free ports 31910 and 31920 on the host.

## Showcase environment

To simplify things the showcase is done in a docker-based environment to reduce prerequisites on the host. All Kubernetes
related tools which are needed for the showcase are part of the container and don't need to be installed manually.


### Launch showcase environment

For Windows:

1. Open a WSL2 terminal window
2. Run the following command:
```bash
docker run -it --name nw-cluster-cli --rm -v //var/run/docker.sock:/var/run/docker.sock ghcr.io/ckotzbauer/kubernetes-showcase/cluster:latest bash
```

For Mac or Linux:

1. Open a terminal window
2. Run the following command:
```bash
docker run -it --name nw-cluster-cli --rm -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/ckotzbauer/kubernetes-showcase/cluster:latest bash
```

The terminal is now connected to the container's bash terminal-session, don't exit the container-session during the showcase!


### Start demo-cluster

Run
```bash
nw-start
```

This starts a three-node Kubernetes cluster with one control-plane and two worker-nodes with Kubernetes 1.28.0.
The startup can take several minutes. When the startup is finished you can inspect the started nodes with the following command:

```bash
kubectl get nodes
```

### Stop demo-cluster

Run
```bash
nw-stop
```

This stops the cluster and removes all docker-configurations which were made during the showcase. You can now safely exit the
showcase-container-session.
