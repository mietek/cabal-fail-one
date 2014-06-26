all: test doc

DEP = .cabal-sandbox
CONFIGURE = dist/setup-config

ifndef PREFIX
	PREFIX = /usr/local
endif

.PHONY: install dep configure build test run doc clean depclean

install: $(DEP)
	cabal install \
	  --enable-documentation \
	  --enable-tests \
	  --global \
	  --ignore-sandbox \
	  --haddock-executables \
	  --prefix=$(PREFIX) \
	  --reorder-goals \
	  --run-tests

$(DEP):
	cabal sandbox init
	cabal install \
	  --dependencies-only \
	  --enable-documentation \
	  --enable-tests \
	  --reorder-goals

$(CONFIGURE): $(DEP)
	cabal configure --enable-tests

dep: $(DEP)

configure: $(CONFIGURE)

build: $(CONFIGURE)
	cabal build

test: $(CONFIGURE)
	cabal test --show-details=streaming --test-options=$(ARGS)

run: $(CONFIGURE)
	cabal run -- $(ARGS)

doc: $(CONFIGURE)
	cabal haddock --executables

clean:
	rm -rf dist

depclean:
	rm -rf .cabal-sandbox cabal.sandbox.config dist
