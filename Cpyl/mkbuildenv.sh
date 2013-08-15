#!/bin/bash
git init
if [ -z "$1" ]; then
    NAME="name"
else
    NAME="$1"
fi
echo "NAME = $NAME" >> config.mk
PYMOD=py"$NAME"
echo "PYMOD = $PYMOD" >> config.mk
echo "$NAME"-test >> .gitignore
echo "$PYMOD".* >> .gitignore
git add config.mk lib.c lib.h lib.i LICENSE Makefile README.md test.c .gitignore
git commit -a -m "Repository initialised by buildenv."
