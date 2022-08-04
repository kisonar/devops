# Wiremock

## APIS
```
http://localhost:8080/hello
http://localhost:8080/__admin/mappings
```

### Editing Stubs

```  
Example:
PUT
http://localhost:8080/__admin/mappings/8c5db8b0-2db4-4ad7-a99f-38c9b00da3f7
{
    "request": {
        "method": "GET",
        "url": "/two"
    },
    "response": {
        "status": 200,
        "body": "Here you have two but modified"
    }
}
```