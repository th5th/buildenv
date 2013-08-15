# Makefile for installing buildenv.
VERSION = 0.1.2.2
BASEPKGS = C C++ Clib Cpyl
LOCALPKGPATH = ./packages
PACKAGES = $(patsubst %, $(LOCALPKGPATH)/%.tar.gz, $(BASEPKGS))
INFOS = $(PACKAGES:.tar.gz=.info)
BINPATH = /usr/local/bin
PKGPATH = /usr/local/etc/buildenv

$(LOCALPKGPATH)/%.tar.gz: %
	mkdir -p $(LOCALPKGPATH)
	tar --exclude=$<.info -czf $@ -C $< `ls -A $<`
	
$(LOCALPKGPATH)/%.info: %
	cp -f $</$<.info $@

local: buildenv.out packages

packages: $(PACKAGES) $(INFOS)

buildenv.out: buildenv
	sed -e 's/##VERSIONDEF/VERSION="$(VERSION)"/' \
		-e 's@##PKGPATHDEF@PKGPATH="$(PKGPATH)"@' \
		buildenv > buildenv.out
	chmod 755 buildenv.out

install: local
	mkdir -p $(BINPATH)
	cp -f buildenv.out $(BINPATH)/buildenv
	chmod 755 $(BINPATH)/buildenv
	mkdir -p $(PKGPATH)
	cp -rf -t $(PKGPATH) $(PACKAGES) $(INFOS)

uninstall:
	rm -f $(BINPATH)/buildenv
	rm -rf $(PKGPATH)

reinstall:
	$(MAKE) uninstall
	$(MAKE) install
	
clean:
	rm -f buildenv.out
	rm -f $(LOCALPKGPATH)/*

.PHONY: local packages
