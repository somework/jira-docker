#!/usr/bin/env bash

docker run -d \
    --name volumerize \
    -v jiradata:/source/jiradata:ro \
    -v postgresqldata:/source/postgresqldata:ro \
    -v letsencrypt_challenges:/source/letsencrypt_challenges:ro \
    -v letsencrypt_certs:/source/letsencrypt_certs:ro \
    -v backup_volume:/backup \
    -v cache_volume:/volumerize-cache \
    -e "VOLUMERIZE_SOURCE=/source" \
    -e "VOLUMERIZE_TARGET=file:///backup" \
    blacklabelops/volumerize