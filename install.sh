#!/usr/bin/env bash

# install.sh will be automatically invoked by Codespaces after cloning into a new space

set -e

git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick

source $HOME/.homesick/repos/homeshick/homeshick.sh

homeshick clone -b jeremyjh/dotfiles

homeshick link -b dotfiles

git clone -b scott https://github.com/scottming/test_iex ~/.test_iex

touch ~/.envlocal
