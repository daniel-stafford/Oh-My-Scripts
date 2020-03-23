#!/bin/bash
echo "Hello World"
echo $(which neqn)
cat $(which neqn)
MY_SHELL="bash"
echo "I like the $MY_SHELL shell"
echo "I am ${MY_SHELL}ing on my keyboard"
SERVER_NAME=$(hostname)
# SERVER_NAME=`hostname`
echo "You are running this script on ${SERVER_NAME}"
if [ "$MY_SHELL" = "zshh" ]; then
  echo "You seem to like the zsh shell"
elif [ "$MY_SHELL" = "bash" ]; then
  echo "Ahh, so you like bash!"
else
  echo "Well, you don't like anything."
fi
ANIMALS="dog cat mouse hamster"
for ANIMAL in $ANIMALS; do
  echo "animal: $ANIMAL"
done

ONENAME=$1
echo "ONENAME $ONENAME"

for NAME in $@; do
  echo "Name: $NAME"
done
read -p "Enter your age: " AGE
echo "Wow, your age is $AGE"
