# CLHN

CLHN is an elegant elixir command line application that allows you to glance at Hacker News.

![screenshot](assets/screenshot.png)

## Usage
```
$ ./hn [best | new | top] [count | 10]
```

## Installation

Assuming you have elixir setup on your machine, clone this repo, then build the script by running

```bash
git clone https://github.com/nichochar/CLHN.git
cd CLHN
mix deps.get
mix escript.build
```

This will output an executable erlang script hn.sh in the root directory:
```bash
./hn top 5
```
