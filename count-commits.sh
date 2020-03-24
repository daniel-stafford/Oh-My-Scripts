#!/bin/bash

OLDIFS=$IFS
IFS=","

if [ "$1" == "-h" ]; then
  echo "Usage: $(basename $0) If you run this script without arguments, output will be a list of author names along with their number of commits.  If names of authors are provided as arugments (write only first name), output will be only commits for those authors."
  exit 0
fi

gitlog=$(git log --pretty="%an,")

if [ "$#" -eq 0 ]; then
  for user in "${gitlog[@]}"; do
    echo $user
  done | sort | uniq -c | sort -nr
  exit 0
fi

function loop_gitLog() {
  for user in "${gitlog[@]}"; do
    echo $user
  done | grep -c $1
}

for userArg in "$@"; do
  result=$(loop_gitLog $userArg)
  echo "$userArg - $result"
done

IFS=$OLDIFS

exit 0
