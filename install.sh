#!/bin/bash

PROJECT_DIR=$(dirname "$0")

rm ~/.zshrc
ln -s $PROJECT_DIR/zshrc ~/.zshrc

rm ~/.config/compton.conf
ln -s $PROJECT_DIR/compton.conf ~/.config/compton.conf

rm -rf ~/.config/awesome
ln -s $PROJECT_DIR/awesome ~/.config/awesome
