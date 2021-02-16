# Source code, build & devops tools tips & tricks 

## Linux
##### Various
```
grep -rnw '/path/to/somewhere/' -e 'pattern' 

systemctl /start/status/stop mysqld
sudo journalctl -u NetworkManager.service

timedatectl set-timezone Europe/Warsaw
sh -s /bin/bash testuser

MBR/GPT clenup
dd if=/dev/zero of=/dev/sdc bs=512 count=1
```
##### Security
```
private/public keys
- transformation
1) set permission to 400
2) puttygen <file-name>.ppk -o <file-name>.pem -O private-openssh

sudo cp -rf /root/.ssh/* /home/username/.ssh/
chown -R username:username /home/username/.ssh

ssh-add keyfile.pem
ssh-keygen -y -f ./svc-testing.pem 

```
##### Keys
```
Generate key pairs
ssh-keygen -t rsa -b 4096 -f ssh_host_rsa_key

Remove passphrase 	
ssh-keygen -p -P $passwd -N "" -f id_rsa
```

##### Users
```
cat /etc/sudoers
cat /etc/passwd
useradd -m -d /PATH/TO/FOLDER newuser
passwd newuser
```
##### Disk management
###### Commands
```
du -xh / |grep '^\S*[0-9\.]\+G'|sort -rn
du -ah /var | sprt -n
```
###### Create new
```
1 create new data volume in Openstack
2 attach created data volume to VM
3 list available devices:lsblk
4 format disk with: mkfs.ext4 /dev/vdb
5 create directory with command: mkdir /some-directory 
6 chmod 777 -R /some-directory 
7 mount -t ext4 /dev/vdb /some-directory 
```
###### Extend one
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
##### Ports and packet sending
```
list opened ports
ss -lntu
netstat

packetsender
```
##### DNF actions
```
sudo dnf install <something aka docker> , e.g. sudo dnf install ansible
sudo dnf update/upgrade
sudo dnf clean all
sudo dnf clean packages
sudo dnf update
```
##### Archives
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
##### IP tables
```
/etc/sysconfig/iptables
iptables -L
iptables -F
iptables -t nat -L
iptables -t nat -A PREROUTING -p udp --dport 514 -j REDIRECT --to 1514
systemctl status iptables
```
##### SCP
```
scp -rp sourcedirectory user@dest:/path
scp -rp user@host:/path-to-dir ./storage-path 

examples:
scp docker-compose.yml centos@1.2.3.4:/home/centos
scp ./test.zip fedora@1.2.3.4:/home/fedora
```
##### SFTP
```
sftp someone@somewhere
lpwd / pwd
lls / ls
put some-file
mput *.txt
get some-file
mget *.txt
```
##### LDAP
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
##### RDP
```
remmina
```

##### Ansible
```
Use version 2.9
ansible-playbook -i hosts.ini playbook-name.yml --skip-tags="proxy" -t="t1,t2"
```

## Docker for Fedora 32

##### Works with
```
fedora-31-2020-04-01
fedora-32-2020-07-28     
```

##### Usage
```
docker images
docker ps
docker logs -f CONTAINER_ID
docker system prune -a
docker ps -q -a | xargs docker stop
docker ps -q -a | xargs docker rm
docker ps -a | grep -v "decisco" | awk '{print $1}' | xargs docker stop
docker ps -a | grep -v "decisco" | awk '{print $1}' | xargs docker rm
docker ps -a | grep -v "decisco" | awk '{print $1}' | xargs docker rmi -f
```
##### Management - use very rare
```
docker shutdown -t now
docker-machine ip
docker-machine env 
docker-machine ssh default
docker-machine regenerate-certs default
docker-machine restart default
```
##### Installation
```
Installation destinantion change:
systemctl stop docker
mv /var/lib/docker /data/
ln -s /data /var/lib/docker
systemctl daemon-reload
sudo systemctl enable docker
systemctl start docker

sudo usermod -a -G docker $USER
~/.docker/config.json
/etc/systemd/system/docker.service.d/override.conf

Problems with certificates

dnf/yum check-update ca-certificates; (($?==100))
dnf/yum update ca-certificates
dnf/yum reinstall ca-certificates
update-ca-trust extract
```
##### Compose
```
docker-compose up -d
docker-compose logs
docker-compose up -d <service-name>
docker-compose down

Before deployment fill ./ansible/stuff/docker/daemon.json for enabling download of docker image from Nexus
```

## Python
```
sudo dnf install python3
sudo dnf install python3-pip

ls /usr/bin/python*
ln -s /usr/bin/python3.6 /usr/local/sbin/python

or 
alternatives --install /usr/bin/python python /usr/bin/python3.6 2
alternatives --install /usr/bin/python python /usr/bin/python2.7 1
alternatives --config python

python --version

pip3 install pyyaml
pip3 install xml2dict
```

## Build tools
##### Gradle 6.x (current 6.8)
```
gradle clean build 
gradle clean build -x test => skip tests
gradle clean build -X test (exclude) 
gradle clean build test --continue
gradle clean build --build-cache
gradle dependencies
gradle dependencyUpdates => requires plugin id 'com.github.ben-manes.versions' version '0.20.0'

scopes
http://andresalmiray.com/maven-scopes-vs-gradle-configurations/
```
##### Maven 3.6.x
```
set MAVEN_OPTS=-Xmx2000m -XX:MaxPermSize=2000m

mvn clean install [-T 4 - threads per build'a, 2C - 2 threads per Core ] [-o] -X (debug mode)
mvn versions:set -DnewVersion=2.0-SNAPSHOTKogut

junit: -Dsurefire.skipAfterFailureCount=1 -DskipTests

surefire-report:report 
cobertura:cobertura 
checkstyle:checkstyle 
pmd:pmd pmd:cpd 
findbugs:findbugs 
javadoc:javadoc 

versions:display-dependency-updates 
versions:display-plugin-updates

mvn clean install versions:display-dependency-updates versions:display-plugin-updates

enforcer:enforce

dependency:analyze-report => does nothing
dependency:analyze-dep-mgt => executes analysis
dependency:analyze-duplicate => searches duplicates
dependency:resolve-plugins
dependency:tree -> builds dependecy tree => good view to read as tree
dependency:tree -DoutputType=graphml -DoutputFile=dependency.graphml [-Dincludes=com.mossad.nac.debt]
dependency:go-offline
-fae
-P profile-1,profile-2

-rf, --resume-from, Resume reactor from specified project
-pl, --projects, Build specified reactor projects instead of all projects
-am, --also-make, If project list is specified, also build projects required by the list
-amd, --also-make-dependents, If project list is specified, also build projects that depend on projects on the list 
-------------------------------------------------------------------------------

Drawing dependencies between modules:

com.github.janssk1:maven-dependencygraph-plugin:1.0:graph  -DoutputType=graphml -DoutputFile=dependency.graphml 

1)
mvn clean install -Dmaven.test.skip=true com.googlecode.maven-overview-plugin:maven-overview-plugin:RELEASE:overview => complec view
mvn clean install -Dmaven.test.skip=true com.googlecode.maven-overview-plugin:maven-overview-plugin:RELEASE:overview -Dinludes=Dincludes=my.com.you.they -Dscopes=compile

2)
mvn dependency:tree -DoutputType=graphml -DoutputFile=dependency.graphml -Dincludes=my.package.ok.package
yEd Graph Editor 
By default yED will not format the graph, but it has many different formats that you can use. Two simple steps separates you from a nice graph:
a) Select Tools > Fit Note to Label > OK This should adjust the labels
b) Select Layout > Hierarchical > Orientation > Left to Right > OK 

3) mvn clean install -Dmaven.test.skip=true com.github.janssk1:maven-dependencygraph-plugin:1.2:graph -e

All in one example:
mvn clean install surefire-report:report cobertura:cobertura site checkstyle:checkstyle pmd:pmd pmd:cpd findbugs:findbugs javadoc:javadoc versions:display-dependency-updates versions:display-plugin-updates dependency:analyze-report dependency:analyze-dep-mgt dependency:analyze-duplicate dependency:resolve-plugins dependency:tree -DoutputType=graphml -DoutputFile=dependency.graphml
```

## Git
##### Git general
```
git checkout -b testing (moves you to local branch testing)
git push origin testing -> makes remote at gitlab
git status
git add file_name
git commit -am "your message"
git commit --amend -s
git pull origin testing
git fetch -p

git reset --hard origin/master
git clean -fd

git branch -d the_local_branch
git branch -D the_local_branch (force mode)

git branch -r

GIT_SSH_COMMAND="ssh -v" git pull

git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D -> clenup
```
##### Gerrit 
```
go to master
git pull
swithc to branch'a local
git rebase master
go to master
git merge branchName --squash
git commit -am "opis jakis" -sq
git commit --amend 
git push origin HEAD:refs/for/master
```
