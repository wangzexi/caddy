FROM caddy:2-builder AS builder
RUN xcaddy build --with github.com/caddy-dns/tencentcloud \
  --with github.com/mholt/caddy-l4 \
  --with github.com/wangzexi/caddy-dynamicdns

FROM caddy:2
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
