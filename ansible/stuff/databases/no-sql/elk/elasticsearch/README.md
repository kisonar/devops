curl -X PUT "localhost:9200/my-index-000001?pretty"
http://localhost:5601/app/dev_tools#/console

http://localhost:9200/_cat/indices
http://localhost:9200/_cat/indices?bytes=b&s=store.size:desc,index:asc&v=true


http://localhost:9200/_cat/nodes?h=ip,port,heapPercent,name

curl -X PUT "localhost:9200/rocco?pretty" -H 'Content-Type: application/json' -d'
{
"settings": {
"number_of_shards": 1,
"number_of_replicas": 0
}
}
'

curl -X PUT "localhost:9200/my-index-000001/_settings" -H 'Content-Type: application/json' -d'
{
"index" : {
"number_of_replicas" : 0
}
}
'


curl -X POST "localhost:9200/my-index-000001/_doc/" -H 'Content-Type: application/json' -d'
{
"@timestamp": "2099-11-15T13:12:00",
"message": "GET /search HTTP/1.1 200 1070000",
"user": {
"id": "kimchy"
}
}
'