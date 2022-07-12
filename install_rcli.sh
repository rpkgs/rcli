#! /bin/zsh

cmd="# RCLI SETTING
rcli=\"`pwd`\"
rcli=\"\$rcli/bin:\$rcli/linux:\$rcli/tidyverse\"
export PATH=\"\$rcli:\$PATH\""

# echo $cmd >> "~.bashrc"
echo $cmd >> ~/.zshrc
# echo $cmd >> a.txt
