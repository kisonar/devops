docker exec -it influxdb3-core influxdb3 create token --admin

New token created successfully!

Token: <token>
HTTP Requests Header: Authorization: Bearer <token>

curl -v "http://localhost:8181/api/v3/write_lp?db=sensors&precision=auto" --data-raw 'home,room=Sunroom temp=9' --header 'Authorization: Bearer <token>'

curl -v "http://localhost:8181/api/v3/query_sql?db=sensors&q=select+*+from+home+limit+5" --header 'Authorization: Bearer <token>'