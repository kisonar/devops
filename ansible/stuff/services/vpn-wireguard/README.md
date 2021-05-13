# WireGuard

## Manual config:
ansible-playbook playbook-services.yml -i hosts.ini --tags="wireguard-keys-generate"
ansible-playbook playbook-services.yml -i hosts.ini --tags="wireguard-install,wireguard-keys-distribute,wireguard-install-manual"

wg -> weryfikacja
ping 10.0.0.1 -> VM1
ping 10.0.0.2 -> VM2

## Automatic config

### Utils
wg-quick up wg0
wg-quick down wg0
wg show
wg showconf <name>

##### Example configs
[root@vm-1 ~]# wg showconf wg0
[Interface]
ListenPort = 51820
PrivateKey = qGMQwihgbuuwDSJn3NDPbw4EDc1RLqAS1MTUUxsAPE8=

[Peer]
PublicKey = tMxK6e36+u1aXB+hlGZvIZ3CMoY2F6UXcC3h57/AYxU=
AllowedIPs = 10.0.0.1/32
Endpoint = 192.168.0.25:51820

------------------------------------------------------------------------------
[Interface]
ListenPort = 51820
PrivateKey = kHQgpRjRZx6VzuSPqm82Wrp1U7bzdIpTIqNDBQpPImY=

[Peer]
PublicKey = Hg2b7nxQkgDuxnyHroJNzhZPuODrbmOioddceT7VTTw=
AllowedIPs = 10.0.0.2/32
Endpoint = 192.168.0.26:51820


