#! /bin/zsh

cmd="# RCLI SETTING
setopt no_nomatch 

rcli=\"`pwd`\"
rcli=\"\$rcli:\$rcli/bin:\$rcli/linux:\$rcli/tidyverse\"
export PATH=\"\$rcli:\$PATH\""

# echo $cmd >> "~.bashrc"
echo $cmd >> ~/.zshrc
# echo $cmd >> a.txt
