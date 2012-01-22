$:.push File.expand_path("../lib", __FILE__)

require "uservoice/version"

Gem::Specification.new do |s|
  s.name        = "uservoice"
  s.version     = Uservoice::VERSION
  s.authors     = ["Alexander Greim"]
  s.email       = ["alexxx@iltempo.de"]
  s.homepage    = "http://github.com/iltempo/uservoice"
  s.summary     = "Uservoice for your Rails application"
  s.description = "This adds Uservoice support to your Rails application including single sign-on."

  s.files = Dir["lib/**/*"] + [
    ".gitignore",
    "LICENSE",
    "Rakefile",
    "README.md"
  ]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.0"
  s.add_dependency "ezcrypto", ">= 0.7.2"

  s.add_development_dependency "sqlite3"
end

