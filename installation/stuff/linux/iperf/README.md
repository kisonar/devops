# Iperf

##### Installation
```  
Go to installation directory and follow below steps:
1) Server part
a) fill hosts.ini
b) run ansible-playbook -i hosts.ini playbook-installation.yml --tags="iperf-server"

2) Client part
a) fill hosts.ini
b) run ansible-playbook -i hosts.ini playbook-installation.yml --tags="iperf-client"

By deafult installation of client covers step that runs report generation.
```