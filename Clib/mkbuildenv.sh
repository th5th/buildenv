#!/bin/bash
git init
if [ -z "$1" ]; then
    NAME="name"
else
    NAME="$1"
fi

echo "NAME = $NAME" >> config.mk
echo "$NAME"-test >> .gitignore

git add config.mk lib.c lib.h LICENSE Makefile README.md test.c .gitignore
git commit -a -m "Repository initialised by buildenv."
