# Zeromqrb

ZeroMQ.rb is a tiny wrapper around awesome ffi-rzmq gem. It provides proxies
for context/sockets/poller that will raise ruby errors on failures, making them
harder to ignore.

## Installation

Add this line to your application's Gemfile:

    gem 'zeromqrb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zeromqrb

## Usage

```ruby
    require 'zero_mq'

    context = ZeroMQ::Context.new
    socket  = context.socket(ZMQ::REQ)

    # proceed using the socket here
    # errors will be raised on failure
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
