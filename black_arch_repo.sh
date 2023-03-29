#!/bin/bash

pacman -Syu

curl -O https://blackarch.org/strap.sh

echo 5ea40d49ecd14c2e024deecf90605426db97ea0c strap.sh | sha1sum -c


# Set execute bit
chmod +x strap.sh

# Run strap.sh
./strap.sh


pacman -Syu
