#!/bin/bash
test() {
  read -p "What's your name?" name
  echo "Hello $name"
}

test

exit 0
