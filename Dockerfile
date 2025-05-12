FROM debian:bookworm-20250428-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    brotli curl ca-certificates git tar && \
    rm -rf /var/lib/apt/lists/*

ENV HUGO_VERSION=0.147.3
ENV HUGO_PACKAGE=hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN curl -L -o /tmp/hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_PACKAGE} && \
    tar -xzf /tmp/hugo.tar.gz -C /tmp && \
    mv /tmp/hugo /usr/local/bin/hugo && \
    chmod +x /usr/local/bin/hugo && \
    rm -rf /tmp/*
