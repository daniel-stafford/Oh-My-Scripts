#!/bin/bash

echo "Running $0"
OWNER=$1
REPO=$2
URL=https://api.github.com/repos/${OWNER}/${REPO}/commits
echo "URL $URL"
COMMITS=$(curl $URL | jq '.[] | .commit.author.name',)
declare -a array=($COMMITS)

arraylength=${#arrat[@]}
echo "arraylength  $arraylength"
OUTPUT=$COMMITS
for user in "$COMMITS"; do
  echo User: $user
done
# echo "$OUTPUT"
echo "Done"
