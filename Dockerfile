# FROM caddy:2-builder AS builder
# RUN xcaddy build \
#   --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
#   --with github.com/caddy-dns/tencentcloud \
#   --with github.com/mholt/caddy-l4
#   # --with github.com/wangzexi/caddy-dynamicdns

# FROM caddy:2
# COPY --from=builder /usr/bin/caddy /usr/bin/caddy

ARG CADDY_VERSION=2.6.1
FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/caddy-dns/tencentcloud \
    --with github.com/mholt/caddy-l4

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
