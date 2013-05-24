#!/bin/bash
git init
if [ -z "$1" ]; then
    echo "CC = gcc" >> config.mk
else
    echo "CC = $1" >> config.mk
fi
git add main.c config.mk Makefile .gitignore
git commit -a -m "Repository initialised by buildenv."
