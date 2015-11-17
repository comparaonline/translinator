$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "translinator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "translinator"
  s.version     = Translinator::VERSION
  s.authors     = ["Mario Negrete"]
  s.email       = ["txus2k@gmail.com"]
  s.homepage    = "https://github.com/comparaonline/translinator"
  s.summary     = "Translations for textinator"
  s.description = "Translations for textinator"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.1.0"
  s.add_dependency "co_config"

  s.add_development_dependency "sqlite3"
end
