FROM alpine as builder

ENV LANG C.UTF-8

RUN apk add --no-cache \
    libusb-dev \
    mosquitto-dev \
    build-base \
    gcc \
    git

RUN \
    git clone https://github.com/karloygard/xcomfortd && \
    cd xcomfortd && \
    make && \
    chmod +x xcomfortd

FROM alpine

RUN apk add --no-cache \
    libstdc++ \
    libusb \
    mosquitto \
    jq

COPY --from=builder /xcomfortd/xcomfortd /usr/bin/xcomfortd

COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]