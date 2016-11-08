require 'sinatra'
require 'erb'

get "/" do
  @number = rand
  template = File.read("index.html.erb")
  ERB.new(template).result(binding)
end
