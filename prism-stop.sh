#!/usr/bin/env bash

docker-compose -p prism -f docker-compose-prism.yml --env-file .env down -v