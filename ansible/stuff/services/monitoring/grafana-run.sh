#!/usr/bin/env bash
docker-compose down
docker-compose up -d grafana
docker-compose logs -f