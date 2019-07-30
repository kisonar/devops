docker-compose down

find ./nxlog/files/output ! -name 'out.txt' -type f -exec rm -f {} +

docker-compose up -d nxlog
docker-compose logs -f