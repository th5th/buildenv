# Makefile for installing buildenv. Currently no compilation required!

DEFAULTTYPES = C C++
BINPATH = /usr/local
# TEMPLATEPATH is hardcoded into the script...
TEMPLATEPATH = /usr/local/etc

dummy:
	@echo No default target. Use \'make install\' or \'make uninstall\'.

install:
	mkdir -p ${BINPATH}/bin
	cp -f buildenv ${BINPATH}/bin
	chmod 755 ${BINPATH}/bin/buildenv
	mkdir -p ${TEMPLATEPATH}/buildenv
	cp -rf -t ${TEMPLATEPATH}/buildenv ${DEFAULTTYPES} 

uninstall:
	rm -f ${BINPATH}/bin/buildenv
	rm -rf ${TEMPLATEPATH}/buildenv
