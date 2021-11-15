FROM alpine:latest
RUN apk update && apk add bash curl openssl \
    && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get-helm && chmod +x get-helm && ./get-helm \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl && mkdir --parents /github/home/.kube/config

ENTRYPOINT ["bash"]
