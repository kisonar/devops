# GoBetween

### Ansible playbook execution
```
Just clone repository, go to installation directory and follow below steps.

1 Changes required in directory
Check and change or leave entries in hosts.ini
Check and change or leave entries in variables.yml

2 Then run :
ansible-playbook -i hosts playbook-services.yml --tags="gobetween"
```

### Ansible playbook execution verification
```
Verify if below settings are available
http://<HOST>:8888 is for REST API
http://<HOST>:8888/ping
http://<HOST>:8888/servers
http://<HOST>:8888/servers/tcp-http/stats
```