# NGINX

### Ansible playbook execution
```
How to run Ansible in order to install & configure NGINX?

Just clone repository, go to installation directory and follow below steps.

1 Changes required in directory
Check and change or leave entries in hosts.ini
Check and change or leave entries in variables.yml

2 Then run :
ansible-playbook -i hosts playbook-services.yml --tags="nginx"
```

### Ansible playbook execution verification
```
Verify if below settings are available
http://<HOST>:8080
```