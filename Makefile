# Makefile for installing buildenv.
DEFAULTTYPES = C C++ Clib
LOCALPKGPATH = ./packages
PACKAGES = $(patsubst %, $(LOCALPKGPATH)/%.tar.gz, $(DEFAULTTYPES))
BINPATH = /usr/local
TEMPLATEPATH = /usr/local/etc

$(LOCALPKGPATH)/%.tar.gz: %
	tar -czf $@ -C $< `ls -A $<`

packages: $(PACKAGES)

install: packages
	mkdir -p $(BINPATH)/bin
	cp -f buildenv $(BINPATH)/bin
	chmod 755 $(BINPATH)/bin/buildenv
	mkdir -p $(TEMPLATEPATH)/buildenv
	cp -rf -t $(TEMPLATEPATH)/buildenv $(PACKAGES) 

uninstall:
	rm -f $(BINPATH)/bin/buildenv
	rm -rf $(TEMPLATEPATH)/buildenv
	
