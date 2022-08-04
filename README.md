# Source code, build & devops tools tips & tricks 

## VirtualBox
```
During VM creation at Storage level Controller: IDE choose ISO as source.
Controller: SATA leave as VDI disk
```

## Linux

### Connectivity
```  
ping <host-fqdn> -c10
nslookup <host-fqdn>
cat /etc/resolv.conf
```

### Various
```
grep -rnw '/path/to/somewhere/' -e 'pattern' 

systemctl /start/status/stop mysqld
sudo journalctl -u NetworkManager.service

timedatectl set-timezone Europe/Warsaw
sh -s /bin/bash testuser

MBR/GPT clenup
dd if=/dev/zero of=/dev/sdc bs=512 count=1
```
### Security

#### Keys
##### Generation
```
Generate key pairs at users's home directory
ssh-keygen -t rsa -b 4096 -f ssh_host_rsa_key

Remove passphrase 	
ssh-keygen -p -P $passwd -N "" -f id_rsa
-------------------------------------------
ssh-keygen -t rsa -C <user>@<host>   -P '' -f <key-file-name>  -m PEM
e.g
ssh-keygen -t rsa -C marcin@kisonar-host   -P '' -f kisonar-host-key  -m PEM

output:
kisonar-host-key
kisonar-host-key.pub

Create if not available .ssh in /home/<user-name> or /root
Create authorized_keys file. Add to it content of generated public key.
```
##### Remote access
```
Copying your Public Key Using ssh-copy-id
ssh-copy-id username@remote_host

If ssh-copy-id not available:
cat ~/.ssh/id_rsa.pub | ssh username@remote_host "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"

Or manually
Edit /home/<user/.ssh/authorized_keys. If not found create such file.
Add here content of generated kisonar-host-key.pub

From other machine execute: ssh -i <key-file-name> <user>@<host>
```
##### Disable login via password
``` 
sudo vi /etc/ssh/sshd_config
PasswordAuthentication no

and then
sudo systemctl restart sshd.service
```
##### Transformation
```
private/public keys
- transformation
1) set permission to 400
2) puttygen <file-name>.ppk -o <file-name>.pem -O private-openssh
```

#### Others
```
sudo cp -rf /root/.ssh/* /home/username/.ssh/
chown -R username:username /home/username/.ssh

ssh-add keyfile.pem
ssh-keygen -y -f ./svc-testing.pem 

```
#### Users
```
cat /etc/sudoers
cat /etc/passwd
useradd -m -d /PATH/TO/FOLDER newuser
passwd newuser
```
### Disk management
#### Commands
```
du -xh / |grep '^\S*[0-9\.]\+G'|sort -rn
du -ah /var | sprt -n
```
#### Create new
```
1 create new data volume in Openstack
2 attach created data volume to VM
3 list available devices:lsblk
4 format disk with: mkfs.ext4 /dev/vdb
5 create directory with command: mkdir /some-directory 
6 chmod 777 -R /some-directory 
7 mount -t ext4 /dev/vdb /some-directory 
```
#### Extend one
```
1 create backup of existing data volume as snapshot in OpenStack
2 find disk UUID with: lsblk -f
3 turn off services using mounted data volume
4 detach data volume from VM: umount  /dev/vdb /some-directory
5 extend data volume in OpenStack
6 attach data volume to VM
7 check disk and resize it to it's new size defined from OpenStack in point 5: 
  e2fsck -f /dev/vdb
  resize2fs /dev/vdb
  In case after attaching disk is not visible in from VM level, reboot VM
8 mount drive: mount -t ext4 /dev/vdb /some-directory

If you want to have everything done in a smooth way, then you can add below steps instead of point 8:
Add entry in/etc/fstab:
UUID=<uuid-entry> /journals ext4 defaults 0 2
where UUID you  get from: lsbkl -f
```
### Ports and packet sending
```
list opened ports
ss -lntu
netstat

packetsender
```
### DNF actions
```
sudo dnf install <something aka docker> , e.g. sudo dnf install ansible
sudo dnf update/upgrade
sudo dnf clean all
sudo dnf clean packages
sudo dnf update
```
### Archives
```
pack
tar -cvf file.tar file1 file2 *.files
tar -czvf file.tar.gz file1 file 2 *.files
tar -cjvf file.tar.bz2 file1 file2 *.files

unpack
tar -xvf file.tar 
tar -xzvf file.tar.gz 
tar -xjvf file.tar.bz2
```
### IP tables
```
/etc/sysconfig/iptables
iptables -L
iptables -F
iptables -t nat -L
iptables -t nat -A PREROUTING -p udp --dport 514 -j REDIRECT --to 1514
systemctl status iptables
```
### SCP
```
scp -rp sourcedirectory user@dest:/path
scp -rp user@host:/path-to-dir ./storage-path 

examples:
scp docker-compose.yml centos@1.2.3.4:/home/centos
scp ./test.zip fedora@1.2.3.4:/home/fedora
```
### SFTP
```
sftp someone@somewhere
lpwd / pwd
lls / ls
put some-file
mput *.txt
get some-file
mget *.txt
```
### LDAP
```
UID (ang. User Identifier) – identyfikator użytkownika
RID (ang. Relative Identifier) – liczba reprezentująca względny identyfikator użytkownika
CN (ang. Common Name) – imię
SN (ang. Surname) – nazwisko
OU (ang. Organizational Unit) – jednostka organizacyjna
O (ang. Organization) – jednostka lub organizacja
DC (ang. Domain Component) – składnik nazwy domenowej
C (ang. Country) – państwo
```
### RDP
```
remmina
```






