cabal-issue-mcmxix
==================

An illustration of [Cabal issue #1919](https://github.com/haskell/cabal/issues/1919).


Usage
-----

Tested with GHC 7.8.3 and cabal-install 1.20.0.3.

    $ make
    cabal sandbox init
    Writing a default package environment file to
    /Users/mietek/Projects/cabal-issue-mcmxix/cabal.sandbox.config
    Creating a new sandbox at
    /Users/mietek/Projects/cabal-issue-mcmxix/.cabal-sandbox
    cabal install --dependencies-only --enable-documentation --enable-tests --reorder-goals
    Resolving dependencies...
    All the requested packages are already installed:
    Use --reinstall if you want to reinstall anyway.
    cabal configure --enable-tests
    Resolving dependencies...
    Configuring cabal-issue-mcmxix-1.0.0...
    cabal haddock --executables
    Running Haddock for cabal-issue-mcmxix-1.0.0...
    Preprocessing library cabal-issue-mcmxix-1.0.0...
    Haddock coverage:
       0% (  0 /  1) in 'Cabal.Issue.Mcmxix'
    Documentation created: dist/doc/html/cabal-issue-mcmxix/index.html
    Preprocessing executable 'cabal-issue-mcmxix' for cabal-issue-mcmxix-1.0.0...
    cabal: internal error when calculating transitive package dependencies.
    Debug info: []
    make: *** [doc] Error 1


License
-------

[MIT](https://github.com/mietek/cabal-issue-mcmxix/blob/master/LICENSE.md) © [Miëtek Bak](http://mietek.io/)
