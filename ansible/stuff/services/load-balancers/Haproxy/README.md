# Haproxy

### Ansible playbook execution
```
Just clone repository, go to installation directory and follow below steps.

1 Changes required in  directory
Check and change entries in hosts.ini
Check and change entries in variables.yml 

If required you may also change haproxy.cfg file.

2 Then run directly from directory:
ansible-playbook -i hosts.ini playbook-services.yml --tags="haproxy"
```

### Ansible playbook execution verification
```
Check if web console of Haproxy is availble
http://<HOST-IP>:<PORT>>/monitor

Graylog nodes shoud be accessed at following URL
http://<GARYLOG-HOST-IP>:<GRAYLOG-PORT>
```

#### Important info
```
Haproxy allows for forwarding TCP & HTTP message
UDP is not supported.
```