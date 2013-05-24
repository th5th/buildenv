# Makefile for installing buildenv.
DEFAULTTYPES = C C++ Clib
PACKAGES = $(patsubst %, %.tar.gz, ${DEFAULTTYPES})
BINPATH = /usr/local
TEMPLATEPATH = /usr/local/etc

packages: ${PACKAGES}

%.tar.gz: %
	if [ -e $</$@ ]; then rm -rf $</$@; fi
	tar --exclude=mkbuildenv.sh -czf $</$@ -C $< `ls -A $<`

install: packages
	mkdir -p ${BINPATH}/bin
	cp -f buildenv ${BINPATH}/bin
	chmod 755 ${BINPATH}/bin/buildenv
	mkdir -p ${TEMPLATEPATH}/buildenv
	cp -rf -t ${TEMPLATEPATH}/buildenv ${DEFAULTTYPES} 

uninstall:
	rm -f ${BINPATH}/bin/buildenv
	rm -rf ${TEMPLATEPATH}/buildenv
	
.PHONY: packages
