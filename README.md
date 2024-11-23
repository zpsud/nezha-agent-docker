# nezha-agant-docker
A Docker version of nezha-agant

```sh
docker run --name nezha-agant -d \
  --restart=unless-stopped \
  -e NEZHA_DASHBOARD_SERVER=domain:port \
  -e NEZHA_AGANT_PASSWORD=password \
  -e NEZHA_AGANT_EXTRA_FLAGS="--disable-auto-update --tls" \
  ghcr.io/zpsud/nezha-agant:latest

```
