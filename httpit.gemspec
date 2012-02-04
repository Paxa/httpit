Gem::Specification.new do |s|
  s.name              = "httpit"
  s.version           = "0.4"
  s.summary           = "Web server for static files"
  s.description       = "Just go to folder and run `httpit`"
  s.author            = "Pavel Evstigneev"
  s.email             = "pavel.evst@gmail.com"
  s.homepage          = "http://github.com/Paxa/httpit"
  s.has_rdoc          = false
  s.executables       = ["httpit"]
  s.rubyforge_project = "httpit"
  s.files             = `git ls-files`.split("\n")
  
  s.add_runtime_dependency 'sinatra', ">= 1.0"
  s.add_runtime_dependency 'haml', '>= 3.0.10'
  s.add_runtime_dependency 'RedCloth', ">= 4.2.3"
  s.add_runtime_dependency 'rufus-tokyo', ">= 1.0.7"
end
