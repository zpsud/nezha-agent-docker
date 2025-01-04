FROM alpine:3 AS downloader

ARG TARGETOS=linux
ARG TARGETARCH=amd64
ARG VERSION=1.0.1

RUN wget https://github.com/nezhahq/agent/releases/download/v${VERSION}/nezha-agent_${TARGETOS}_${TARGETARCH}.zip \
    && unzip nezha-agent_${TARGETOS}_${TARGETARCH}.zip \
    && rm nezha-agent_${TARGETOS}_${TARGETARCH}.zip \
    && chmod +x /nezha-agent

FROM alpine:3
RUN apk update && apk add --no-cache ca-certificates && rm -rf /var/cache/apk/*

WORKDIR /app

COPY --from=downloader /nezha-agent /app/nezha-agent
COPY ./entrypoint.sh /app/entrypoint.sh

VOLUME [ "/app/data" ]

ENV NZ_SERVER=
ENV NZ_CLIENT_SECRET=
ENV NZ_TLS=false
ENV NZ_DISABLE_AUTO_UPDATE=true
ENV NZ_DISABLE_FORCE_UPDATE=false
ENV NZ_DISABLE_COMMAND_EXECUTE=true
ENV NZ_SKIP_CONNECTION_COUNT=false
ENV NZ_UUID=

ENTRYPOINT ["/app/entrypoint.sh"]
