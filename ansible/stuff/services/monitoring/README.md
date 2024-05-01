# Monitoring

## Nxlog

### Running
```
nxlog-run.sh
```
### TEST
```
nxlog-test.sh
it copies template files to nxlog input, which processes it to TCP GELF or output file
```

### Graylog
``` 
GET /api/system/inputs
curl -u user_token:token -H 'Content-Type: application/json' -H 'X-Requested-By: cli' 'http://graylog.domain.com:9000/api/system/inputs'



localhost:9000

```


Graylog
opis
nxlog
definiowanie inputu z nxlog
zapychanie

TODO
streams
extractors
grafana
rabbit

