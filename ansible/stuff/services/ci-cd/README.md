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
You must set it up for first run: e.g Nexus2022
After password setup file /nexus-data/admin.password is being removed. 
```
#### Notes
```
1. Open NEXUS web UI in a browser (URL printed by Ansible)
2. Click 'Sign in'
3. Provide temporary credentials:
    * username: admin
    * password: a temporary password printed by Ansible task
4. Complete the wizard:
    * set admin password, take it from the KeePass
    * check 'Enable anonymous access'
    * click Finish
5. Click settings (gear) icon on the top to go to the configuration tab
6. Add blob stores (Repository -> Blob Stores -> Create Blob Store):
    1. Type: File, Name: docker-images, Path: /nexus-data/blobs/docker-images
    2. Type: File, Name: binaries, Path: /nexus-data/blobs/binaries
7. Open Repositories
8. Remove all default repositories (maven and nuget).
8. Create new repositories (click Create repository):
    1. docker (hosted) - Name: docker-images, HTTP: 9200, Allow anonymous docker pull: checked,
       Blob store: docker-images, Deployment Policy: Disable redeploy, Allow redeploying the 'latest' tag
    2. raw (hosted) - Name: binaries, Blob store: binaries, Deployment Policy: Disable redeploy
9.  Add the Docker Bearer Token Realm to Active realms (Security -> Realms)
10. Create the 'uploader' role (Security -> Roles -> Create role -> Nexus role):
    * Role ID: uploader
    * Role name: uploader
    * Role description: Can upload an artifact to a repository
    * Privileges (use filters to find):
        * nx-component-upload
        * nx-repository-view-*-*-add
        * nx-repository-view-*-*-browse
        * nx-repository-view-*-*-edit
        * nx-repository-view-*-*-read
11. Add an 'uploader' local user (Security -> Users -> Create User -> Local User):
    * ID: uploader
    * First name: Uploader
    * Last name: Name
    * Email: uploader@example.com
    * Password: mandingo
    * Roles: uploader
    * Status: Active
    * The rest of the required fields can be of any value.
```