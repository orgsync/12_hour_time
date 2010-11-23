require File.expand_path("../lib/12_hour_time/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "12_hour_time"
  s.version     = TwelveHourTime::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nick Muerdter", "Maurice Aubrey"]
  s.email       = ["samer@abukhait.com"]
  s.homepage    = "http://github.com/abukhait/12_hour_time"
  s.summary     = "12 Hour Time"
  s.description = "AM/PM 12 Hour Time Helper"

  s.required_rubygems_version = ">= 1.3.7"

  # lol - required for validation
  s.rubyforge_project         = "12_hour_time"

  # If you have other dependencies, add them here
  # s.add_dependency "another", "~> 1.2"

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path = 'lib'

  # If you need an executable, add it here
  # s.executables = ["12_hour_time"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"
end
