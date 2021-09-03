#!/bin/sh

docker create \
  --name=netbootxyz \
  -e PUID=1000 \
  -e PGID=1000 \
  --network=n10.10 \
  -p 3000:3000 \
  -p 69:69/udp \
  -p 8080:80 `#optional` \
  -v /path/to/config:/config \
  -v /path/to/assets:/assets `#optional` \
  --restart unless-stopped \
  linuxserver/netbootxyz
