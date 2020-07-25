.PHONY: all install clean dist

prefix ?= /usr
exec_prefix ?= ${prefix}
datadir ?= ${exec_prefix}/share
cmakepath ?= ${datadir}/cmake
thisdir := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

PKGNAME := tegra-cmake-overrides
PKGVER  := 1.0.0

all:
	@:
clean:
	@:
install:
	install -d $(DESTDIR)$(cmakepath)/Modules/FindCUDA
	install -m 0644 Modules/FindCUDA.cmake $(DESTDIR)$(cmakepath)/Modules/
	install -m 0644 Modules/FindCUDA/*.cmake $(DESTDIR)$(cmakepath)/Modules/FindCUDA/
dist: 
	rm -rf $(PKGNAME)-$(PKGVER)
	mkdir $(PKGNAME)-$(PKGVER)
	cp -R $(thisdir)/Makefile $(thisdir)/README.md $(thisdir)/LICENSE $(thisdir)/Modules $(PKGNAME)-$(PKGVER)/
	tar -c -z -f $(shell pwd)/$(PKGNAME)-$(PKGVER).tar.gz $(PKGNAME)-$(PKGVER)
