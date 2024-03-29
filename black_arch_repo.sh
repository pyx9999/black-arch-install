#!/bin/bash

curl -O https://blackarch.org/strap.sh

echo 5ea40d49ecd14c2e024deecf90605426db97ea0c strap.sh | sha1sum -c

echo $(whoami) "...above...did the sha pass...?"

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
 

if confirm; then
    echo "User chose YES. Executing the operation..."
    chmod +x strap.sh
    echo "now lets install the black arch repo..."
    ./strap.sh
    pacman -Syu
    exit

else
    echo "User chose NO. Aborting the operation..."
    echo "someone may be doing something sneaky"
    echo "...the sha doesnt match..."
    sha1sum strap.sh
    echo "...investigate further..."
    echo "...visit https://blackarch.org/downloads.html...."
    echo "remove strap.sh"
    exit
fi


exit
