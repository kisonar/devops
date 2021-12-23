# Ansible

## Usage

### Often used
```
ansible-playbook -i hosts-cloud.ini playbook-installation.yml
ansible-playbook -i hosts-cloud.ini playbook-services.yml
```

### Arm local computer
```
sudo ansible-playbook playbook-installation-localhost.yml 
```

### Additional rare support
```
sudo ansible-playbook -i hosts.ini playbook-services-tools-additions.yml
``` 

### Filtering
```
ansible-playbook -i hosts.ini playbook-services.yml --tags="docker"
``` 