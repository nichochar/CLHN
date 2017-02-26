# CLHN

CLHN is a very simple elixir application that allows you to read Hacker News articles from the command line.


# Example

[![asciicast](https://asciinema.org/a/67eapy68l75102k10i4bbyw33.png)](https://asciinema.org/a/67eapy68l75102k10i4bbyw33)


```
╭─nicholas@panix.local
╰─➤  ./hn top 10
Fetching 10 top stories...
| (271) Linus on Git and SHA-1                                                                                   |
| https://plus.google.com/+LinusTorvalds/posts/7tp2gYWQugL                                                       |


| (416) Machine Learning from scratch: Bare bones implementations in Python                                      |
| https://github.com/eriklindernoren/ML-From-Scratch                                                             |


| (157) The Future of Not Working                                                                                |
| https://www.nytimes.com/2017/02/23/magazine/universal-income-global-inequality.html                            |


| (72) The Google project to put an aquarium full of water bears inside a phone                                  |
| http://venturebeat.com/2017/02/24/complicated-weird-beautiful-the-secret-google-project-to-put-an-aquarium-full-of-tiny-wiggly-water-bears-inside-your-phone/


| (34) My GF and I just opened the Digital Nomad House in Malta on a tiny rocky island                           |
| https://digitalnomads-malta.com/                                                                               |


| (299) Warren Buffett's Annual Letter to Berkshire Hathaway Shareholders [pdf]                                  |
| http://berkshirehathaway.com/letters/2016ltr.pdf                                                               |


| (116) Unofficial MySQL 8.0 Optimizer Guide                                                                     |
| http://www.unofficialmysqlguide.com/                                                                           |


| (77) Lessons from the History of Attacks on Secure Hash Functions                                              |
| https://z.cash/technology/history-of-hash-function-attacks.html                                                |


| (170) Id Software Programming Principles                                                                       |
| http://blog.felipe.rs/2017/02/25/id-software-programming-principles/                                           |


| (16) Self-Driving Cars Have a Bicycle Problem                                                                  |
| http://spectrum.ieee.org/transportation/self-driving/selfdriving-cars-have-a-bicycle-problem                   |
```

## Usage
```
$ ./hn [best | new | top] [count | 10]
```

## Installation

Simply clone this repo, then build the script by running 
```
mix escript.compile
```
This will output an executable erlang script hn.sh in the root directory of this repository, that you can then call directly with
```
./hn top 5
```

