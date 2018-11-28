# flipper

[![Build Status](https://travis-ci.org/metaware/flipper.svg?branch=master)](https://travis-ci.org/metaware/flipper)
[![LICENSE](https://img.shields.io/github/license/metaware/flipper.svg)](https://github.com/metaware/flipper/blob/master/LICENSE)
[![GitHub tag](https://img.shields.io/github/tag/metaware/flipper.svg)](https://github.com/metaware/flipper/releases/latest)

> Feature flipping is the act of enabling or disabling features or parts of your application, ideally without re-deploying or changing anything in your code base.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  flipper:
    github: metaware/flipper
```

## Usage

```crystal
require "flipper"
```

You are free to use anyone of the supported adapters/stores from [crystal-kiwi](https://github.com/crystal-community/kiwi)

```crystal
Flipper.adapter = Kiwi::RedisStore.new(Redis.new)
```

```crystal
Flipper.enable(:feature_name)

if Flipper.enabled?(:feature_name)
  puts "Feature launched, Let's roll!"
else
  puts "Feature not released yet."
end

Flipper.disable(:search)

if Flipper.disabled?(:search)
  puts "Search is not available yet!"
end
```

Note: I strongly recommend to not use `Kiwi::MemoryStore` for development or production environments. It's suitable only for your test environments.

## Roadmap

- [x] Simple Logic Gate
- [ ] Groups
- [ ] Individual Users/Actors
- [ ] Percentage of Actors

## Contributing

1. Fork it ( https://github.com/metaware/flipper/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Credits

- A huge shoutout to [flipper](https://github.com/jnunemaker/flipper) (Ruby) and [rollout](https://github.com/fetlife/rollout) (Ruby) for inspiration.
- `flipper` stands on work done by [greyblake](https://github.com/greyblake) on [crystal-kiwi](https://github.com/greyblake/crystal-kiwi)

## Contributors

- [Jasdeep Singh](https://github.com/jasdeepsingh) - creator, maintainer
