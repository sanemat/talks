#!/bin/bash
# see: for lualatex: Linux/Linux Mint - TeX Wiki https://texwiki.texjp.org/?Linux%2FLinux%20Mint
SLIDE_TITLE=20161101-build-uxto-cli
stack exec pandoc -- --template=./html5github.html5 -f markdown -t html5 index.md -s -o index.html
stack exec pandoc -- -f markdown index.md -o "$SLIDE_TITLE".pdf --latex-engine=lualatex -V lang:english -V documentclass=ltjarticle
