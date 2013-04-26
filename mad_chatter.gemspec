$:.push File.expand_path("../lib", __FILE__)
require "mad_chatter/version"

Gem::Specification.new do |s|
  s.name        = "mad_chatter"
  s.version     = MadChatter::VERSION
  s.authors     = ["Andrew Havens"]
  s.email       = ["email@andrewhavens.com"]
  s.homepage    = "http://madchatter.github.io/"
  s.summary     = "Mad Chatter is a fun, easy to customize chat server written in Ruby utilizing HTML 5 Web Sockets"
  s.description = "Mad Chatter is a fun, easy to customize chat server written in Ruby utilizing HTML 5 Web Sockets"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.13"

  # websockets
  s.add_dependency "faye"
  s.add_dependency "thin"

  # authentication
  s.add_dependency "bcrypt-ruby"

  # UI and styles
  s.add_dependency "jquery-rails"
  s.add_dependency "sass-rails"
  s.add_dependency "backbone-on-rails"
  s.add_dependency "bootstrap-sass"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
