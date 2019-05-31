FROM alpine:latest

RUN apk add --no-cache netcat-openbsd python3 jq && \
    pip3 install --upgrade pip setuptools httpie httpie-jwt-auth && \
    rm -r /root/.cache

COPY scripts /scripts

ENTRYPOINT [ "/scripts/docker-entrypoint.sh" ]
CMD ["--help"]
