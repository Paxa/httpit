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

## Use cases

* Develop websites with HAML & SASS but without backend
* Share files to mobile devices (if we access over Wi-Fi)
* Try some 3rd-party examples what requires absolute urls (src="/files/...")