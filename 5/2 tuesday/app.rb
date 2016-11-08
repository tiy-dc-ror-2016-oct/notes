require 'sinatra'
require 'erb'
require 'pry'
require './weather-client/ten_day_forecast'

helpers do
  def render_template(filename)
    template = File.read(filename)
    ERB.new(template).result(binding)
  end
end

get "/" do
  @number = rand
  render_template("index.html.erb")
end

post "/weather/for" do
  @weather = TenDayForecast.new.get(params["zip"])
  render_template("weather.html.erb")
end


post "/weather/for/city" do
  @weather = TenDayForecast.new.get("#{params["state"]}/#{params["city"]}")
  render_template("weather.html.erb")
end
