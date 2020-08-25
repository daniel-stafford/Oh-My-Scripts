#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "👎 $(tput setaf 1) Please provide the name of the remote you want to push to as an arugment"
    echo "$(tput setaf 6) e.g. bash push-branch.sh $(tput setaf 3)upstream"
    exit 2
fi

current_branch=$(git rev-parse --abbrev-ref HEAD)

echo "🤖🤖 $(tput setaf 6) Making sure your local branch has the latest changes from the develop branch 🤖🤖$(tput setaf 7)"
git pull $1 develop

echo "$(tput setaf 3) Checking for console.logs or display $(tput setaf 7)"
SEARCH=$(grep -rE --include \*.ts --exclude-dir={node_modules,utils}  'console.log|display' . )

echo "$SEARCH"

if [ -z "$SEARCH" ]
then
 echo "👌 Nice! No logs found!"
 sleep .5
else
    echo "..."
    echo "⚠️   ⚠️  Logs found."
    read -p "$(tput setaf 3) ❓❓ Are you sure you want to continue? <y/N> " prompt
  if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
  then
    echo "👍 OK, I will push those logs."
  else
    echo "👎 OK, I will not push your branch. Go clean up your logs. Use the regex expression:

    display\(|console.log\([^des]|\{ display \}

    to find them!"
    exit 1
  fi
fi

echo " $(tput setaf 3) Pushing the following commits and changes: $(tput setaf 6)"
git cherry -v "$1"/develop
echo "..."
sleep 2
git diff --stat --patch  --color=always $1/develop | cat
sleep 2

git push "$1" head && echo " 😀 $(tput setaf 6)Congrats! I pushed $(tput setaf 3)$current_branch$(tput setaf 6) to your remote $1 repo!"