require 'minitest/autorun'
require 'minitest/pride'
require './ten_day_forecast'
require 'webmock/minitest'
require 'active_support'
require 'active_support/core_ext'

class TenDayForecastTest < Minitest::Test

  def test_class_exists
    assert TenDayForecast
  end

  def test_can_access_ten_day_forecast_for_20877
      stub_request(
        :get,
        "http://api.wunderground.com/api/#{ENV['WU_API_KEY']}/forecast10day/q/20877.json"
      ).to_return(
        :status => 200,
        :body => File.read("queries/gaithersburg_ten_day_forecast.json"),
        :headers => { 'Content-Type' => 'application/json'}
      )
      ten_day_forecast = TenDayForecast.new.get(20877)
      assert_equal '1477965600', ten_day_forecast['forecast']['simpleforecast']['forecastday'][0]['date']['epoch']
  end

end
