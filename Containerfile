FROM docker.io/library/caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http \
    --with github.com/hslatman/caddy-crowdsec-bouncer/appsec
#--with github.com/lanrat/caddy-dynamic-remoteip

FROM docker.io/library/caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy