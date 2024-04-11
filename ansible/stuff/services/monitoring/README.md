# Monitoring

## Nxlog

### Running
```
nxlog-run.sh
```

### Graylog
``` 
GET /api/system/inputs
curl -u user_token:token -H 'Content-Type: application/json' -H 'X-Requested-By: cli' 'http://graylog.domain.com:9000/api/system/inputs'

```