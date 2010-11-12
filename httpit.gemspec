Gem::Specification.new do |s|
  s.name              = "httpit"
  s.version           = "0.3.3"
  s.summary           = "Web server for static files"
  s.description       = "Just go to folder and run `httpit`"
  s.author            = "Pavel Evstigneev"
  s.email             = "pavel.evst@gmail.com"
  s.homepage          = "http://github.com/Paxa/httpit"
  s.has_rdoc          = false
  s.executables       = ["httpit"]
  s.rubyforge_project = "httpit"
  s.files             = [ "bin/httpit", "README.md", "httpit.gemspec", "lib", "example", "example/index.haml", "example/main.sass", "example/readme.md", "example/images/bird.jpg"]
  
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 1.0"])
      s.add_runtime_dependency(%q<haml>, [">= 3.0.10"])
      s.add_runtime_dependency(%q<RedCloth>, [">= 4.2.3"])
      
    else
      s.add_dependency(%q<sinatra>, [">= 1.0"])
      s.add_dependency(%q<haml>, [">= 3.0.10"])
      s.add_dependency(%q<RedCloth>, [">= 4.2.3"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 1.0"])
    s.add_dependency(%q<haml>, [">= 3.0.10"])
    s.add_dependency(%q<RedCloth>, [">= 4.2.3"])
  end
end
