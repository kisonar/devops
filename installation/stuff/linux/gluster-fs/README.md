# Gluster FS

## Requirements
```
Install at Ansible Controller manually
ansible-galaxy collection install gluster.gluster

It is also beign done during ansible-playbook run.
```

# Notes
```
Before starting installation fill in /etc/hosts entries related to all cluster nodes

/var/log/gluster/*

gluster volume info
gluster peer probe <HOST-NAME>
```