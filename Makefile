# Makefile for installing buildenv.
VERSION = 0.1.1
BASEPKGS = C C++ Clib
LOCALPKGPATH = ./packages
PACKAGES = $(patsubst %, $(LOCALPKGPATH)/%.tar.gz, $(BASEPKGS))
BINPATH = /usr/local/bin
PKGPATH = /usr/local/etc/buildenv

$(LOCALPKGPATH)/%.tar.gz: %
	tar -czf $@ -C $< `ls -A $<`

packages: $(PACKAGES)

install: packages
	mkdir -p $(BINPATH)
	sed -e 's/##VERSIONDEF/VERSION="$(VERSION)"/' \
		-e 's@##PKGPATHDEF@PKGPATH="$(PKGPATH)"@' \
		buildenv > buildenv.out
	cp -f buildenv.out $(BINPATH)/buildenv
	chmod 755 $(BINPATH)/buildenv
	mkdir -p $(PKGPATH)
	cp -rf -t $(PKGPATH) $(PACKAGES) 

uninstall:
	rm -f $(BINPATH)/buildenv
	rm -rf $(PKGPATH)
	
