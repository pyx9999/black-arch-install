#!/bin/bash

pacman -Syu

curl -O https://blackarch.org/strap.sh


# Set execute bit
chmod +x strap.sh

# Run strap.sh
./strap.sh


pacman -Syu
