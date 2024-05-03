#!/usr/bin/env bash

gcloud compute instances create example-instance \
         --image-family ubuntu-2204-lts \
         --image-project ubuntu-os-cloud \
         --zone asia-east1-a \
         --boot-disk-size 64GB \
         --tags=http-server,https-server \
         --metadata-from-file user-data=cloud-init-amd64.yaml