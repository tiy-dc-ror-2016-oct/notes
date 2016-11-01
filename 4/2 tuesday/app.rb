require 'bundler/setup'
require 'sinatra'
require 'pry'
require './bmangelsen-weather-conditions-report/conditions'

ENV["RACK_ENV"] = "test"

class App < Sinatra::Base

  # Expose my machine to my students for hopefully non evil purposes
  # set :bind, '0.0.0.0'

  get "/greeter" do
    name = params["name"] || "Class"
    "Hello, #{name}"
  end

  get "/weather" do
    content_type("application/json")

    JSON.pretty_generate Conditions.new(params["zip"]).data
  end

  # /speak?msg=hi
  post "/speak" do
    text = request.body.read
    unless text.empty?
      post_hash = JSON.parse(text)
      params.merge!(post_hash)
    end

    content_type("application/json")
    speak(params['msg'], params["voice"] || "Princess") if params["msg"]
    {message: params["msg"]}.to_json
  end

  def speak(msg, voice)
    `say -v #{voice} #{msg}`
  end

end
