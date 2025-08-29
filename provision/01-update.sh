#!/bin/bash
set -e

echo ">>> Updating packages..."
sudo apt-get update -y
sudo apt-get upgrade -y
