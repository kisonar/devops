#!/usr/bin/env bash
docker-compose down
docker-compose up -d grafana graylog
#docker-compose logs -f