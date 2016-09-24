#!/bin/bash
SLIDE_TITLE=20160907-how-to-be-friends-with-bundler
stack exec pandoc -- --template=./html5github.html5 -f markdown -t html5 index.md -s -o index.html
stack exec pandoc -- -f markdown index.md -o "$SLIDE_TITLE".pdf --latex-engine=lualatex -V lang:english -V documentclass=ltjarticle
