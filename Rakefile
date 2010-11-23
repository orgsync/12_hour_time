require "bundler"
Bundler.setup

require "rspec/core/rake_task"
Rspec::Core::RakeTask.new(:spec)

gemspec = eval(File.read("12_hour_time.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["12_hour_time.gemspec"] do
  system "gem build 12_hour_time.gemspec"
  system "gem install 12_hour_time-#{TwelveHourTime::VERSION}.gem"
end
