# Copyright (c) 2022 FEROX YT EIRL, www.ferox.yt <devops@ferox.yt>
# Copyright (c) 2022 Jérémy WALTHER <jeremy.walther@golflima.net>
# See <https://github.com/frxyt/docker-cd-docker> for details.

FROM alpine:latest
LABEL maintainer="Jérémy WALTHER <jeremy@ferox.yt>"

RUN set -ex; \
    apk add --no-cache \
        bash \
        ca-certificates \
        curl \
        docker \
        docker-cli-compose \
        docker-compose \
        git \
        python3~3.11 \
        py3-pip; \
    pip3 install --break-system-packages \
        j2cli[yaml] \
        jq \
        yq;

RUN set -ex; \
    cat /etc/alpine-release; \
    bash --version; \
    curl --version; \
    docker --version; \
    docker compose version; \
    docker-compose --version; \
    git --version; \
    j2 --version; \
    jq --version; \
    python3 --version; \
    yq --version;

WORKDIR /work

ENTRYPOINT [ "/bin/bash", "-lc" ]
CMD [ "bash" ]