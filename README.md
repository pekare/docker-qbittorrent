
docker run -e OPENVPN_USERNAME=? --device=/dev/net/tun:/dev/net/tun --cap-add=NET_ADMIN --sysctl='net.ipv6.conf.all.disable_ipv6=0' -p 8080:8080 pekare/qbittorent:latest