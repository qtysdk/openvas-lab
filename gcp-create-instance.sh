#!/usr/bin/env bash

gcloud compute instances create example-instance \
         --image-family ubuntu-2204-lts \
         --image-project ubuntu-os-cloud \
         --zone asia-east1-a \
         --metadata-from-file user-data=gcp-init.yaml