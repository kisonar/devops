#!/usr/bin/env bash
docker-compose down
find ./nxlog/files/input ! -name 'input.log' -type f -exec rm -f {} +
chmod 666 ./nxlog/files/output/out.json
chmod 666 ./nxlog/files/output/out.csv
docker-compose up -d nxlog
docker-compose logs -f