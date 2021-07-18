FROM docker:dind
RUN apk update && apk add bash curl \
    && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64 \
    && chmod +x ./kind \
    && mv kind /usr/local/bin/ \
    && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get-helm && chmod +x get-helm && ./get-helm \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT ["bash"]
