# Make static web server from any folder

Build on sinatra, useful for developing JS applications and doing "psd => xhtml" works

## Usage

```bash
gem install httpit
cd /folder/for/server
httpit
# or you can set port
httpit 9081
```

## Features

* Haml support
* Sass support 
* MarkDown support

To complile `sass` file make request for `style.sass.css`

See `example` folder