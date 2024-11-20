FROM caddy:2-builder AS builder
RUN xcaddy build --with github.com/caddy-dns/tencentcloud=github.com/wangzexi/tencentcloud@master \
  --with github.com/mholt/caddy-l4 \
  --with github.com/wangzexi/caddy-dynamicdns
  # --with github.com/sagikazarmark/caddy-fs-s3

FROM caddy:2
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
