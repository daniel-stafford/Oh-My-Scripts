#!/bin/bash
# make a directory and cd to it
test -d "$1" || mkdir "$1" && cd "$1"
