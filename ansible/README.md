# Ansible

## Usage

### Often used
```
ansible-playbook -i hosts.ini playbook-installation.yml
ansible-playbook -i hosts.ini playbook-services.yml
```

### Arm local computer
```
below one may require to be run manually
sudo ansible-playbook -i hosts.ini playbook-installation-localhost.yml 
```

### Additional rare support
```
sudo ansible-playbook -i hosts.ini playbook-services-tools-additions.yml
``` 