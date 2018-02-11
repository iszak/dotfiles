Dot Files
====

[![Build Status](https://travis-ci.org/iszak/dotfiles.svg)](https://travis-ci.org/iszak/dotfiles)


## Vim

- Install plugins

      vim +PluginInstall +qall


### JavaScript

- Ensure node.js is installed
- Install eslint globally

      npm install --global eslint


### Autocomplete

- Compile autocomplete support

      cd ~/.vim/bundle/YouCompleteMe
      ./install.py --go-completer --rust-completer --js-completer

