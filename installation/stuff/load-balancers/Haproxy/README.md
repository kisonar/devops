# Haproxy

## Installation and upgrade of Haproxy with usage of Ansible 

### Ansible playbook execution

#### Pre-requisite
```
Before you start deployment install docker and docker-compose on target machine.
Keep in mind that both docker and docker-compose installations depend on OS type.
```

#### Running playbook
```
Just clone repository, go to Haproxy directory and follow below steps.

1 Changes required in ansible directory
Check and change entries in variables.yml 
Check and change entries in hosts

If required you may also change haproxy.cfg file.

2 Then run directly from ansible directory:
ansible-playbook -i hosts.ini playbook-installation.yml --tags="haproxy"
```

#### Ansible playbook execution verification

```
Check if web console of Haproxy is availble
http://<HOST-IP>:<PORT>>/monitor

Graylog nodes shoud be accessed at following URL
http://<GARYLOG-HOST-IP>:<GRAYLOG-PORT>
```

## Important info
```
Haproxy allows for forwarding TCP & HTTP message
UDP is not supported.
```