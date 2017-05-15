# CLHN

CLHN is a very simple elixir application that allows you to read Hacker News articles from the command line.

![screenshot](assets/screenshot.png)

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
