Gem::Specification.new do |s|
  s.name              = "httpit"
  s.version           = "0.4.7"
  s.summary           = "Web server for static files"
  s.description       = "Just go to folder and run `httpit` to make it avaliable as web-server"
  s.author            = "Pavel Evstigneev"
  s.email             = "pavel.evst@gmail.com"
  s.homepage          = "http://github.com/Paxa/httpit"
  s.has_rdoc          = false
  s.executables       = ["httpit"]
  s.rubyforge_project = "httpit"
  s.files             = File.read(__FILE__).match(/__#{'END'}__(.+)\z/m)[1].strip.split("\n")
  s.licenses          = ['MIT', 'GPL-2']
  
  s.add_runtime_dependency 'sinatra', "~> 1.4.2"
  s.add_runtime_dependency 'haml', '~> 4.0.2'
  s.add_runtime_dependency 'RedCloth', "~> 4.2.9"
  s.add_runtime_dependency 'sass', "~> 3.2.8"
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
