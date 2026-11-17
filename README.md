# Nitter

A free and open source alternative Twitter front-end focused on privacy and
performance. \
Inspired by the [Invidious](https://github.com/iv-org/invidious) project.

## Features

- No JavaScript required
- Zero ads
- All requests go through the backend, client never talks to Twitter
- Prevents Twitter from tracking your IP or JavaScript fingerprint
- Uses Twitter's unofficial API (no developer account required)
- Lightweight (for [@nim_lang](https://nitter.net/nim_lang), 60KB vs 784KB from twitter.com)
- RSS feeds (instance-specific, often disabled due to abuse)
- Themes
- Mobile support (responsive design)
- AGPLv3 licensed, no proprietary instances permitted

## Why?

It's impossible to use Twitter without JavaScript enabled, and as of 2024 you
need to sign up. For privacy-minded folks, preventing JavaScript analytics and
IP-based tracking is important, but apart from using a VPN and uBlock/uMatrix,
it's impossible. Despite being behind a VPN and using heavy-duty adblockers,
you can get accurately tracked with your [browser's
fingerprint](https://restoreprivacy.com/browser-fingerprinting/), [no
JavaScript required](https://noscriptfingerprint.com/). This all became
particularly important after Twitter [removed the
ability](https://www.eff.org/deeplinks/2020/04/twitter-removes-privacy-option-and-shows-why-we-need-strong-privacy-laws)
for users to control whether their data gets sent to advertisers.

Using an instance of Nitter (hosted on a VPS for example), you can browse
Twitter without JavaScript while retaining your privacy. In addition to
respecting your privacy, Nitter is on average around 15 times lighter than
Twitter, and in most cases serves pages faster (eg. timelines load 2-4x faster).

In the future a simple account system will be added that lets you follow Twitter
users, allowing you to have a clean chronological timeline without needing a
Twitter account.

## Screenshot

![nitter](/screenshot.png)

## Installation

### Dependencies

#### macOS

```bash
brew install redis libsass nim
brew services start redis
```

### Running

```bash
cp nitter.example.conf nitter.conf
nimble -l build -d:danger --mm:refc
# on macOS
nim r '--hint[Processing]:off' --dynlibOverride:libsass --passl:"-L$(brew --prefix libsass)/lib" --passl:-lsass tools/gencss
nimble -l md
./nitter
```

### Flushing caches

```bash
redis-cli flushall
```
