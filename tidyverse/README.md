
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dplyr-cli

<!-- badges: start -->

![](https://img.shields.io/badge/cool-useless-green.svg)
<!-- badges: end -->

`dplyr-cli` uses the `Rscript` executable to run dplyr commands on CSV
files in the terminal.

`dplyr-cli` makes use of the terminal pipe `|` instead of the magrittr
pipe (`%>%`) to run sequences of commands.

    cat mtcars.csv | group_by cyl | summarise "mpg = mean(mpg)" | kable
    #> | cyl|      mpg|
    #> |---:|--------:|
    #> |   4| 26.66364|
    #> |   6| 19.74286|
    #> |   8| 15.10000|

## Motivation

I wanted to be able to do quick hacks on CSV files on the command line
using dplyr syntax, but without actually starting a proper R session.

## What dplyr commands are supported?

Any command of the form:

-   `dplyr::verb(.data, code)`
-   `dplyr::*_join(.data, .rhs)`

Currently two extra commands are supported which are not part of
`dplyr`.

-   `csv` performs no dplyr command, but only outputs the input data as
    CSV to stdout
-   `kable` performs no dplyr command, but only outputs the input data
    as a `knitr::kable()` formatted string to stdout

## Limitations

-   Only tested under ‘bash’ on OSX. YMMV.
-   Every command runs in a separate R session.
-   When using special shell characters such as `()`, you’ll have to
    quote your code arguments. Some shells will require more quoting
    than others.
-   “joins” (such as `left_join`) do not currently let you specify the
    `by` argument, so there must be columns in common to both dataset

## Usage

``` sh
dplyr --help
```

    #  dplyr-cli
    #  
    #  Usage:
    #      dplyr <command> [--file=fn] [--csv | -c] [--verbose | -v] [<code>...]
    #      dplyr -h | --help
    #  
    #  Options:
    #      -h --help            show this help text
    #      -f FILE --file=FILE  input CSV or RDS filename. If reading from stdin, assumes CSV [default: stdin]
    #      -c --csv             write output to stdout in CSV format (instead of default RDS file)
    #      -v --verbose         be verbose

## History

#### v0.1.0 2020-04-20

-   Initial release

#### v0.1.1 2020-04-21

-   Switch to ‘Rscript’ for easier install for users
-   rename ‘dplyr.sh’ to just ‘dplyr’

#### v0.1.2 2020-04-21

-   Support for joins e.g. `left_join`

#### v0.1.3 2020-04-22

-   More robust tmpdir handling

#### v0.1.4 2022-01-23

-   Fix handling for latest `read_csv()`. Fixes #9

## Contributors

-   [aborusso](https://github.com/aborruso) - documentation

## Installation

Because this script straddles a great divide between R and the shell,
you need to ensure both are set up correctly for this to work.

1.  Install R packages
2.  Clone this repo and put `dplyr` in your path

#### Install R packages - within R

`dplyr-cli` is run from the shell but at every invocation is starting a
new rsession where the following packages are expected to be installed:

``` r
install.packages('readr')    # read in CSV data
install.packages('dplyr')    # data manipulation
install.packages('docopt')   # CLI description language
```

<details>
<summary>
Click to reveal instructions for installing packages on the command line
</summary>

To do it from the cli on a linux-ish system, install `r-base`
(`sudo apt -y install r-base`) and then run

``` bash
sudo su - -c "R -e \"install.packages('readr', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('dplyr', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('docopt', repos='http://cran.rstudio.com/')\""
```

</details>

#### Clone this repo and put `dplyr` in your path

You’ll then need to download the shell script from this repository and
put `dplyr` somewhere in your path.

    git clone https://github.com/coolbutuseless/dplyr-cli
    cp dplyr-cli/dplyr ./somewhere/in/your/search/path

