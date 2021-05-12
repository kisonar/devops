# WireGuard

## Manual config:
ansible-playbook playbook-services.yml -i hosts.ini --tags="wireguard,wireguard-install,wireguard-keys,wireguard-install-manual"
wg set wg0 peer tMxK6e36+u1aXB+hlGZvIZ3CMoY2F6UXcC3h57/AYxU= allowed-ips 10.0.0.1/32 endpoint 192.168.0.25:51820 -> WM-1
wg set wg0 peer Hg2b7nxQkgDuxnyHroJNzhZPuODrbmOioddceT7VTTw= allowed-ips 10.0.0.2/32 endpoint 192.168.0.26:51820 -> VM-0


foreach
ip link set up dev wg0
ping 10.0.0.1 -> VM1
ping 10.0.0.2 -> VM2
wg -> weryfikacja

## Automatic config

### Utils
wg-quick up wg0
wg-quick down wg0
wg show
wg showconf