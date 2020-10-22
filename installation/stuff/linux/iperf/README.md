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
##### Information
```
iperf3 
-s (run as server) -f (format M Mbytes,Gbytes) M -p (change port) 3456 -D (daemon) -w (buffer size) 500K 
-c (client) -R (reverse mode) --get-server-output (at client) -d (bi-directional)
-P (number of parallel client streams) 2
```

##### Example manual runs
```
Run server: iperf3 -s -f K -D > iperf3.log
Run client: iperf3 -c <iperf-server-ip> -f K
```