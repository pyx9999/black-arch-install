#!/bin/bash

pacman -Syu

curl -O https://blackarch.org/strap.sh

echo 5ea40d49ecd14c2e024deecf90605426db97ea0c strap.sh | sha1sum -c

echo $(whoami) "did the sha pass...?"

function confirm() {
    while true; do
        read -p "Do you want to proceed? (YES/NO/CANCEL) " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            [Cc]* ) exit;;
            * ) echo "Please answer YES, NO, or CANCEL.";;
        esac
    done
}
 
# Example usage of the confirm function
if confirm; then
    echo "User chose YES. Executing the operation..."
    chmod +x strap.sh
else
    echo "User chose NO. Aborting the operation..."
    exit
fi

echo "now lets install the black arch repo..."



# Run strap.sh
./strap.sh


pacman -Syu
