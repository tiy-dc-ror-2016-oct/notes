require 'httparty'
require 'bundler/setup'
require 'pry'
require_relative 'wu_api'

class Conditions < WuApi

  def feature
    "conditions"
  end

  def location
    data['current_observation']['display_location']['full']
  end

  def weather
    data['current_observation']['weather']
  end

  def temp_f
    data['current_observation']['temp_f']
  end

  def wind_speed
    data['current_observation']['wind_mph']
  end

  def wind_direction
    data['current_observation']['wind_dir']
  end

end
