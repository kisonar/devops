# MongodDB

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
l: admin
p: password
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