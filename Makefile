prefix ?= /usr/local


all: doc


.PHONY: dep configure build test run doc clean depclean

.cabal-sandbox:
	cabal sandbox init
	cabal install --dependencies-only --enable-documentation --enable-tests --reorder-goals

dep: .cabal-sandbox

dist/setup-config: dep
	cabal configure --enable-tests

configure: dist/setup-config

build: configure
	cabal build

test: configure
	cabal test --show-details=streaming --test-options=$(ARGS)

run: configure
	cabal run -- $(ARGS)

doc: configure
	cabal haddock --executables

clean:
	rm -rf dist

depclean:
	rm -rf .cabal-sandbox cabal.sandbox.config dist


.PHONY: install

install: .cabal-sandbox
	cabal --ignore-sandbox --no-require-sandbox install --enable-documentation --enable-tests --global --haddock-executables --prefix=$(prefix) --reorder-goals --run-tests
