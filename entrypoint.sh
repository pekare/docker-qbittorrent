#!/bin/sh

echo "######## Setting vpn credentials"
echo "${OPENVPN_USERNAME}" > /etc/openvpn/mullvad_userpass.txt
echo "m" >> /etc/openvpn/mullvad_userpass.txt
chmod 600 /etc/openvpn/mullvad_userpass.txt

echo "######## Making resolv-conf script executable"
chmod +x /etc/openvpn/update-resolv-conf

echo "######## Change UID/GID for qbittorent user"
groupmod -o -g "${PGID}" qbittorrent
usermod -o -u "${PUID}" qbittorrent
chown -R qbittorrent:qbittorrent /config

echo "######## Starting services with supervisord"
exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf