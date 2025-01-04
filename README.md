# nezha-agent-docker
A Docker version of nezha-agent.

## V1

```sh
docker run --name nezha-agent -d \
  --restart=unless-stopped \
  -e NZ_SERVER=ip:port \
  -e NZ_TLS=true \
  -e NZ_CLIENT_SECRET=client-secret \
  -e NZ_UUID=uuid \
  -v ./data:/app/data \
  ghcr.io/zpsud/nezha-agent:latest
```

> - UUID generation: `uuidgen`
>   > Install `uuidgen` CLI: `apt install uuid-runtime`
> - JavaScript(web browser console): `crypto.randomUUID()`

## V0

```sh
docker run --name nezha-agent -d \
  --restart=unless-stopped \
  -e NEZHA_DASHBOARD_SERVER=domain:port \
  -e NEZHA_AGENT_PASSWORD=password \
  -e NEZHA_AGENT_EXTRA_FLAGS="--disable-auto-update --tls" \
  ghcr.io/zpsud/nezha-agent:0.20.5
```