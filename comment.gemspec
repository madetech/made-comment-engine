$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "comment/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "comment"
  s.version     = Comment::VERSION
  s.authors     = ["Seb Ashton"]
  s.email       = ["seb@madebymade.co.uk"]
  s.homepage    = "http://www.madebymade.co.uk/"
  s.summary     = "Comments integration engine."
  s.description = "Rails engine that provides a polymorphic model that allows commenting on a given set of models"


  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "kaminari"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
end
