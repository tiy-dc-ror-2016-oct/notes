require "bundler/setup"
require "sinatra/base"
require "json"
require "./employee_db/employee"
require "active_record"
require "./db_connection"
require './employee_db/migrations'
require './employee_db/department'
