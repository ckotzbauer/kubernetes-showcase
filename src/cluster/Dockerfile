FROM --platform=$TARGETPLATFORM ubuntu:22.04

ENV K8S_VERSION 1.28.1
ENV KIND_VERSION 0.20.0
ARG TARGETARCH

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl gnupg ca-certificates nano bash-completion && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
      tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y --no-install-recommends docker-ce docker-ce-cli containerd.io && \
    curl -Lo /usr/bin/kubectl "https://dl.k8s.io/release/v${K8S_VERSION}/bin/linux/${TARGETARCH}/kubectl" && \
    curl -Lo /usr/bin/kind "https://kind.sigs.k8s.io/dl/v${KIND_VERSION}/kind-linux-${TARGETARCH}" && \
    chmod +x /usr/bin/kubectl /usr/bin/kind && \
    mkdir /etc/bash_completion.d && \
    kubectl completion bash | tee /etc/bash_completion.d/kubectl > /dev/null && \
    chmod a+r /etc/bash_completion.d/kubectl && \
    echo "source /usr/share/bash-completion/bash_completion" >/root/.bashrc && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /nw-kubernetes/config /nw-kubernetes/manifests

ADD kind-config.yaml /nw-kubernetes/config
ADD start-cluster.sh /nw-kubernetes/config
ADD stop-cluster.sh /nw-kubernetes/config
WORKDIR /nw-kubernetes/manifests

RUN chmod +x /nw-kubernetes/config/start-cluster.sh /nw-kubernetes/config/stop-cluster.sh && \
    echo 'alias nw-start=/nw-kubernetes/config/start-cluster.sh' >>~/.bashrc && \
    echo 'alias nw-stop=/nw-kubernetes/config/stop-cluster.sh' >>~/.bashrc
