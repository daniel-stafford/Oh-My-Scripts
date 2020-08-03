#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "👎 $(tput setaf 1) Please provide the name of the dev dependecy you want to move to proudct dependcies"
    echo "$(tput setaf 6) e.g. bash dev-to-prod.sh $(tput setaf 3) nodemon"
    exit 2
fi

yarn remove $1 --dev && yarn add $1
