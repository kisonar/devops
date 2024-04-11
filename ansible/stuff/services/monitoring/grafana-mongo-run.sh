#!/usr/bin/env bash
docker-compose down
docker-compose up -d grafana mongo
#docker-compose logs -f