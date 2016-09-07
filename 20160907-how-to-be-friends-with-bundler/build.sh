#!/bin/bash
# cp html5github.html5 ~/.pandoc/templates/.
SLIDE_TITLE=20160907-how-to-be-friends-with-bundler
~/.cabal/bin/pandoc --template=html5github -f markdown -t html5 index.md -s -o index.html
~/.cabal/bin/pandoc -f markdown index.md -o "$SLIDE_TITLE".pdf --latex-engine=lualatex -V lang:english -V documentclass=ltjarticle
