#!/usr/bin/env bash
docker-compose down
docker-compose up -d prometheus grafana
#docker-compose logs -f