# R commands in cmd

> Dongdong Kong

## References

> 1. https://github.com/coolbutuseless/dplyr-cli

## How to use?

```bash
# vim .zshrc
# change pwd to your workdir
rcli=`pwd`
rcli="$rcli/bin:$rcli/linux:$rcli/tidyverse"
echo $rcli
export PATH="$rcli:$PATH"


cmd="# RCLI SETTING
rcli=\"`pwd`\"
rcli=\"\$rcli/bin:\$rcli/linux:\$rcli/tidyverse\"
export PATH=\"\$rcli:\$PATH\""

echo $cmd >> a.txt

```
