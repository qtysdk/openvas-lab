#!/usr/bin/env bash

# Fetch and store the IP in a variable
IP_ADDRESS=$(gcloud compute instances describe example-instance --zone asia-east1-a --format="value(networkInterfaces[0].accessConfigs[0].natIP)")

# Print the IP address
echo "External IP Address: $IP_ADDRESS"

# Use the IP and environment variable in the curl command
curl -X PUT \
  "https://api.cloudflare.com/client/v4/zones/$CF_ZONE_ID/dns_records/$CF_RECORD_ID" \
  -H "Authorization: Bearer $CF_TOKEN" \
  -H "Content-Type: application/json" \
  --data '{"type":"A","name":"'"$CF_SUBDOMAIN"'","content":"'"$IP_ADDRESS"'", "proxied":true}' | jq .
