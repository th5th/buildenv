#!/bin/bash
git init
if [ -z "$1" ]; then
    echo "CC = gcc" >> config.mk
else
    echo "CC = $1" >> config.mk
fi
git add test.c lib.c lib.h config.mk Makefile .gitignore
git commit -a -m "Repository initialised by buildenv."
