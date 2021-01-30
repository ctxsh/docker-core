FROM debian:bullseye-slim as extract

ENV S6_VERSION v2.1.0.2
WORKDIR /output

RUN : \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    gnupg \
    ca-certificates \
    gpg \
    gpg-agent \
    curl \
  && :

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-amd64.tar.gz /tmp/s6.tgz
ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-amd64.tar.gz.sig /tmp/s6.tgz.sig

RUN : \
  && curl https://keybase.io/justcontainers/key.asc | gpg --import \
  && gpg --verify /tmp/s6.tgz.sig /tmp/s6.tgz \
  && tar xzf /tmp/s6.tgz -C /output \
  && :

FROM debian:bullseye-slim

COPY --from=extract /output /
COPY requirements3.txt /tmp/requirements3.txt

RUN : \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends \
        netcat \
        curl \
        jq \
        ca-certificates \
        python3-minimal \
        python3-venv \
        python3-pip \
    && pip3 install -r /tmp/requirements3.txt \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && rm -rf /tmp/* \
    && :

CMD ["/bin/bash"]