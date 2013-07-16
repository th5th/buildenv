#!/bin/bash
git init
if [ -z "$1" ]; then
    NAME="name"
else
    NAME="$1"
fi
echo "NAME = $NAME" >> config.mk
echo "$NAME" >> .gitignore
git add config.mk LICENSE main.cpp Makefile README.md .gitignore
git commit -a -m "Repository initialised by buildenv."
