# Docker

## Usage
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
## Management - use very rare
```
docker shutdown -t now
docker-machine ip
docker-machine env 
docker-machine ssh default
docker-machine regenerate-certs default
docker-machine restart default
```
## Installation
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