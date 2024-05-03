#!/usr/bin/env bash
multipass launch --name primary --memory 4G --disk 32G \
--mount $HOME/temp/openvas-lab:/home/ubuntu/data \
--cloud-init cloud-init.yaml
