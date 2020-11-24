# Ansible

## Usage
```
ansible-playbook -i hosts.ini playbook-installation.yml
ansible-playbook -i hosts.ini playbook-services.yml

below one may require to be run manually
sudo ansible-playbook -i hosts.ini playbook-installation-localhost.yml 
```