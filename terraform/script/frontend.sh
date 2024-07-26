#!/bin/bash

# Update package list and install dependencies
sudo apt-get update

# Restart the ssm agent
sudo systemctl restart snap.amazon-ssm-agent.amazon-ssm-agent.service
