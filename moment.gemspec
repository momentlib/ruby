# moment.gemspec

Gem::Specification.new do |s|
  s.name    = "moment"
  s.version = "1.0.0"
  s.summary = "Natural Language Date Parser for Ruby"
  s.author  = "Kevin Musselman"

  s.files = Dir.glob("ext/**/*.{c,rb}") +
            Dir.glob("lib/**/*.rb")

  s.extensions << "ext/moment/extconf.rb"
 	
  s.require_paths = ["lib"]
  s.add_development_dependency "rake-compiler"
end
