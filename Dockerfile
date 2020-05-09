FROM debian:unstable

VOLUME /config

RUN apt-get update && \
    apt-get install -y supervisor openvpn qbittorrent-nox && \
    mkdir -p /var/log/supervisor && \
    groupadd -g 911 qbittorrent && \
    useradd -u 911 -g 911 qbittorrent

COPY openvpn/ /etc/openvpn
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8080