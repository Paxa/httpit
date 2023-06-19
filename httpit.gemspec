Gem::Specification.new do |s|
  s.name              = "httpit"
  s.version           = "0.5.0"
  s.summary           = "Web server for static files"
  s.description       = "HTTP sever for directory index with extra features"
  s.author            = "Pavel Evstigneev"
  s.email             = "pavel.evst@gmail.com"
  s.homepage          = "http://github.com/Paxa/httpit"
  s.executables       = ["httpit"]
  s.rubyforge_project = "httpit"
  s.files             = File.read(__FILE__).match(/__#{'END'}__(.+)\z/m)[1].strip.split("\n") - ['Gemfile.lock']
  s.licenses          = ['MIT', 'GPL-2']

  s.add_runtime_dependency 'sinatra', "~> 3.0.6"
  s.add_runtime_dependency 'haml', '~> 6.1.1'
  s.add_runtime_dependency 'kramdown', "~> 2.4.0"
  s.add_runtime_dependency 'sass', "~> 3.7.4"
end

# git ls-files
__END__
.gitignore
Gemfile
Gemfile.lock
LICENSE
README.md
bin/httpit
example/images/bird.jpg
example/index.haml
example/main.sass
example/readme.md
example/testing_design/_header.haml
example/testing_design/index.haml
example/testing_design/layout.sass
httpit.gemspec
views/listing.haml
views/not_found.haml
views/utils.js
views/view.haml
