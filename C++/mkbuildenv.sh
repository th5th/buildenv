#!/bin/bash
git init
if [ -z "$1" ]; then
    echo "CXX = g++" >> config.mk
else
    echo "CXX = $1" >> config.mk
fi
git add main.cpp config.mk Makefile .gitignore
git commit -a -m "Repository initialised by buildenv."
