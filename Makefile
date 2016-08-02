all: build

test:
	swift test

build:
	swift build
#	swift build -Xswiftc -j1

rebuild: clean build

clean:
	swift build --clean

distclean:
	swift build --clean dist

fetch-master:
	swift package fetch

tags:
	ctags -R ./ ../swift-corelibs-foundation/

.PHONY: all build rebuild clean distclean pull-master tags
