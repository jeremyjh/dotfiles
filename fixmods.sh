#!/bin/bash
rm -rf home/.vim/bundle/$1
git rm --cached home/.vim/bundle/$1
git submodule add $2 home/.vim/bundle/$1
