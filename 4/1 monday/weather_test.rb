require 'minitest/autorun'
require 'minitest/pride'
require './weather'
require 'webmock/minitest'

require 'active_support'
require 'active_support/core_ext'

class WeatherTest < Minitest::Test
  def test_class_exists
    assert Weather
  end

  def test_can_get_weather
    stub_request(
      :get,
      "https://api.darksky.net/forecast/c841c27242dd50d1a1744bf123872c95/39.2659259,-77.6989605"
    ).to_return(
      :status => 200,
      :body => File.read("responses/lovettsville_get.json"),
      :headers => {}
    )

    Weather.new.get(39.2659259,-77.6989605)
  end

  def test_can_get_weather_for_a_different_time
    at_this_time = 3.days.ago.to_i

    stub_request(
      :get,
      "https://api.darksky.net/forecast/c841c27242dd50d1a1744bf123872c95/39.2659259,-77.6989605,#{at_this_time}"
    ).to_return(
      :status => 200,
      :body => File.read("responses/lovettsville_get.json"),
      :headers => {}
    )

    Weather.new.at(39.2659259,-77.6989605, at_this_time)
  end
end
