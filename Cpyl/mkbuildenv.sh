#!/bin/bash
git init
if [ -z "$1" ]; then
    NAME="name"
else
    NAME="$1"
fi
echo "NAME = $NAME" >> config.mk
git add config.mk lib.c lib.h LICENSE Makefile README.md test.c
git commit -a -m "Repository initialised by buildenv."
