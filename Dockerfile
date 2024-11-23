FROM alpine:3 as downloader

ARG TARGETOS=linux
ARG TARGETARCH=amd64
ARG VERSION=0.20.3

RUN wget https://github.com/nezhahq/agent/releases/download/v${VERSION}/nezha-agent_${TARGETOS}_${TARGETARCH}.zip \
    && unzip nezha-agent_${TARGETOS}_${TARGETARCH}.zip \
    && rm nezha-agent_${TARGETOS}_${TARGETARCH}.zip \
    && chmod +x /nezha-agent

FROM alpine:3
RUN apk update && apk add --no-cache ca-certificates && rm -rf /var/cache/apk/*

COPY --from=downloader /nezha-agent /usr/local/bin/nezha-agent
COPY ./entrypoint.sh /entrypoint.sh
#RUN chmod 755 /entrypoint.sh

ENV NEZHA_DASHBOARD_SERVER #server_name:port
ENV NEZHA_AGANT_PASSWORD #password
ENV NEZHA_AGANT_EXTRA_FLAGS="--disable-auto-update --tls"

ENTRYPOINT ["/entrypoint.sh"]
