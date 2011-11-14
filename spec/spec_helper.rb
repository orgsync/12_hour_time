require "bundler"
Bundler.setup
require 'acts_as_fu'
require "rspec"
require "12_hour_time"
require "support/matchers"

RSpec.configure do |config|
  config.include ActsAsFu
end