#!/usr/bin/env bash
export DOWNLOAD_DIR=$HOME/greenbone-community-container && mkdir -p $DOWNLOAD_DIR
docker compose -f $DOWNLOAD_DIR/docker-compose.yml -p greenbone-community-edition logs -f
