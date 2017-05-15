# CLHN

CLHN is a very simple elixir application that allows you to read Hacker News articles from the command line.


# Example

```
╭─nicholas@panix.local
╰─➤  ./hn top 3
Fetching 10 top stories...
| (271) Linus on Git and SHA-1                                                                                   |
| https://plus.google.com/+LinusTorvalds/posts/7tp2gYWQugL                                                       |


| (416) Machine Learning from scratch: Bare bones implementations in Python                                      |
| https://github.com/eriklindernoren/ML-From-Scratch                                                             |


| (157) The Future of Not Working                                                                                |
| https://www.nytimes.com/2017/02/23/magazine/universal-income-global-inequality.html                            |
```

## Usage
```
$ ./hn [best | new | top] [count | 10]
```

## Installation

Simply clone this repo, then build the script by running

```bash
mix escript.build
```

This will output an executable erlang script hn.sh in the root directory of this repository, that you can then call directly with
```bash
./hn top 5
```

## ASCIINEMA
[![asciicast](https://asciinema.org/a/67eapy68l75102k10i4bbyw33.png)](https://asciinema.org/a/67eapy68l75102k10i4bbyw33)
