#!/bin/bash
sudo apt-get update

# Restart ssm agent
sudo systemctl restart snap.amazon-ssm-agent.amazon-ssm-agent.service