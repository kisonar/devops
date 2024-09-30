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

http://localhost:9000

ELASTIC SEARCH
http://localhost:9200/_cat/indices
http://localhost:9200/_cat/shards
```

Graylog
opis co to jest, architeltura
nxlog
definiowanie inputu z nxlog
zapychanie, bufory, journal

TODO
streams, pipeline'y i extractory
extractors
grafana
rabbit

