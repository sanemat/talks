#!/bin/bash
# cp html5github.html5 ~/.pandoc/templates/.
SLIDE_TITLE=20150122-metarubygems-org
~/.cabal/bin/pandoc --template=html5github -f markdown -t html5 index.md -s -o index.html
~/.cabal/bin/pandoc -f markdown index.md -o "$SLIDE_TITLE".pdf --latex-engine=lualatex -V lang:english -V documentclass=ltjarticle
