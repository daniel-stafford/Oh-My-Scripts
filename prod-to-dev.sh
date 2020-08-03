#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "👎 $(tput setaf 1) Please provide the name of the product dependecy you want to move to dev dependcies"
    echo "$(tput setaf 6) e.g. bash prod-to-dev.sh $(tput setaf 3) nodemon"
    exit 2
fi

yarn remove $1 && yarn add $1 --dev
