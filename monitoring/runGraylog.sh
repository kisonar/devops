docker-compose down
find ./nxlog/files/input ! -name 'input.log' -type f -exec rm -f {} +
docker-compose up -d graylog
docker-compose logs -f