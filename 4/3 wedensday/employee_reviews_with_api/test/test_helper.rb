require "bundler/setup"
ENV["RACK_ENV"] = "test"

begin
  require "pry"
rescue LoadError
end


require "minitest/autorun"
require "minitest/pride"
require "rack/test"

require "./app"
ActiveRecord::Migration.verbose = false
