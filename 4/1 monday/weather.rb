require 'bundler/setup'
require 'httparty'
require 'pry'

class Weather
  BASE_URI = "https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/"
  def get(lat, lng)
    HTTParty.get("#{BASE_URI}#{lat},#{lng}")
  end

  def at(lat, lng, time)
    HTTParty.get("#{BASE_URI}#{lat},#{lng},#{time}")
  end
end
