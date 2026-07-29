# MariaDB
## Docker image
```
https://hub.docker.com/_/mariadb
```
### Setup
```
In docker-compose service name must be named as db so that adminer works fine
```
#### Adminer
```  
localhost:8085
system: mysql
server: db
database name: default_database
user/password: root/root 
```