# MongodDB

## 9.0.8 does not work on MacOs 27.2 and Podman 5.8.3
```
MongoDB cannot start: 
Linux kernel versions 6.19.0 through 7.0.13 have a known incompatibility with this version of MongoDB. 
See https://jira.mongodb.org/browse/SERVER-121912 for more information.

# Last working version is 8.3.11
```

### Urls

``` 
Mongo express
localhost:9000
```

### Notes

```
For created user check mongo-init.js
Collextion is being created when first document is written to collection

At startup there is created user:
l: my-user
p: my-password

database: my-database

admin credential:
l: adminUser
p: passwordUser
```

#### Searches

```
For nested entries
{
  integration: "something",
  "attributes.userId":
    "someUser"
}  
```