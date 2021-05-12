# WireGuard

## Manual config:
ansible-playbook playbook-services.yml -i hosts.ini --tags="wireguard,wireguard-install,wireguard-keys,wireguard-install-manual"

## Automatic config

### Utils
wg-quick up wg0
wg-quick down wg0
wg show
wg showconf