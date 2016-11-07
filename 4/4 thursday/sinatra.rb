require 'sinatra/base'
require 'active_record'
require 'sqlite3'
require './user'


ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: 'dev.sqlite3'
})

class App < Sinatra::Base
  set :static, true

  before "/api/*" do
    puts "GOTS A REQUEST!!!!!" + Time.now.to_i.to_s
    content_type "application/json"
  end

  before agent: /curl/ do
    puts "you trying to c a url?"
  end

  get '/' do
    {message: "I am running"}.to_json
  end

  get '/api' do
    {message: "I am api"}.to_json
  end

  get '/api/users' do
    User.all.to_json
  end

  # get '/19839647.png' do
  #   content_type "image/png"
  #   body File.read("public/19839647.png")
  # end

  run! if app_file == $PROGRAM_NAME
end
