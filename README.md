# PierAnonymizer

In order to be LGPD compliant, this gem offers utils to anonymize data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pier_anonymizer'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pier_anonymizer

## Installing from other projects as a private gem

### Without docker

If you are going to install locally without docker, please execute:
```
$ bundle config --local GITHUB__COM _token_:x-oauth-basic
``` 
Where `_token_` is your PAT in github. Then, run the bundle command:

```
$ bundle
```

### Using docker

However, if you're gonna use docker, probably running one of our projects, it might exists the `Makefile` with the following command:
```
install:
	@test -n "$(GH_AUTH_TOKEN)" || (echo 'You must set GH_AUTH_TOKEN env var' && exit 1)
	docker-compose run --rm users bundle config --local GITHUB__COM $(GH_AUTH_TOKEN):x-oauth-basic
	docker-compose run --rm users bundle install
.PHONY: install
```

Then, all you have to do is set the environment variable `GH_AUTH_TOKEN` with your PAT in your local machine. 
To do so, edit `~/.bash_profile`, `~/.bashrc` or any other config file with the env var below: 
```
export GH_AUTH_TOKEN=_token_
```

Now, without closing the terminal, execute:
```
$ source _file_
```
To update the terminal session and get the last config with the env var. Notice that `_file_` represents the file which you have added the env var.

Finally, you will be able to install all dependencies:
```
$ make install
```

## Contributing

Bug reports and pull requests are welcome on GitHub. This project is intended to be a safe and welcoming space for collaboration.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
