FROM alpine:edge

RUN apk add --no-cache --update supervisor openvpn && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing qbittorrent-nox && \
    apk add --no-cache -X http://dl-2.alpinelinux.org/alpine/edge/community shadow && \
    rm  -rf /tmp/* /var/cache/apk/* && \
    mkdir -p /var/log/supervisor

COPY openvpn/ /etc/openvpn
COPY supervisord.conf /etc/supervisord.conf

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME ["/config", "/downloads"]

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8080