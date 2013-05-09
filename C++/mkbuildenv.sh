#!/bin/bash
git init
git add .
git reset -- buildenv.tar.gz mkbuildenv.sh
git commit -a -m "Repository initialised by buildenv."
