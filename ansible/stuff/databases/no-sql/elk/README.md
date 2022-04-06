```
Compatibilty Matrix
https://www.elastic.co/support/matrix#matrix_compatibility
```

```  
Elasticsearch
http://localhost:9200
```

``` 
Kibana
http://localhost:5601
http://localhost:5601/app/dev_tools#/console
```


#Queries
```
curl -X PUT "localhost:9200/my-index?pretty" -H 'Content-Type: application/json' -d'
{
"settings": {
"number_of_shards": 1,
"number_of_replicas": 0
}
}
'

curl -X PUT "localhost:9200/my-index/_settings" -H 'Content-Type: application/json' -d'
{
"index" : {
"number_of_replicas" : 0
}
}
'

curl -X POST "localhost:9200/my-index/_doc/" -H 'Content-Type: application/json' -d'
{
"@timestamp": "2099-11-15T13:12:00",
"message": "GET /search HTTP/1.1 200 1070000",
"user": {
"id": "kimchy"
}
}


GET chargepoints/_search
{
"query": {
"bool": {
"must_not": {
"exists": {
"field": "chargePointLocation.operator"
}
}
}
}
}
```