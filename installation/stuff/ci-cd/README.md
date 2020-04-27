# CI/CD Services

## Jenkins

### Running
```
docker-compose up -d jenkins
cat buildTools/ci-cd/jenkins/secrets/initialAdminPassword
Manually setup proxy 10.144.1.10:8080
```

## Nexus

### Running
```
docker-compose up -d nexus
Your admin user password is located in /nexus-data/admin.password on the server.
```