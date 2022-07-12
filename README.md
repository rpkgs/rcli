# R commands in cmd

> Dongdong Kong


## How to install `rcli`?

```bash
## solution 1:  vim .zshrc
# change pwd to your workdir
rcli=`pwd`
rcli="$rcli/bin:$rcli/linux:$rcli/tidyverse"
echo $rcli
export PATH="$rcli:$PATH"

## solution 2
./install_rcli.sh
```

## References

> 1. https://github.com/coolbutuseless/dplyr-cli
