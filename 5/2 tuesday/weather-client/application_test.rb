require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './application'
require 'webmock/minitest'
require 'active_support'
require 'active_support/core_ext'

class ApplicationTest < Minitest::Test
  class ::WeatherApp
    def get_zip
      "20877"
    end
  end

  def setup
    stub_conditions_for_zip("20877")
    stub_alerts_for_zip("20877")
    stub_astronomy_for_zip("20877")
    stub_forecast10day_for_zip("20877")
  end

  def test_asks_for_a_zip_code_and_reports_weather
    assert_output(/Please enter your desired zip code/) do |msg|
      WeatherApp.new.run!
    end
  end

  def test_tells_us_10_day_forecast
    assert_output(/Tuesday: Chance of a morning shower/) do |msg|
      WeatherApp.new.run!
    end
  end



  def stub_conditions_for_zip(zip)
    stub_request(
      :get,
      "http://api.wunderground.com/api/#{ENV['WU_API_KEY']}/conditions/q/#{zip}.json"
    ).to_return(
      :status => 200,
      :body => File.read("queries/gaithersburg_current_conditions.json"),
      :headers => { 'Content-Type' => 'application/json'}
    )
  end

  def stub_alerts_for_zip(zip)
    stub_request(
      :get,
      "http://api.wunderground.com/api/#{ENV['WU_API_KEY']}/alerts/q/#{zip}.json"
    ).to_return(
      :status => 200,
      :body => File.read("queries/montana_alerts.json"),
      :headers => { 'Content-Type' => 'application/json'}
    )
  end

  def stub_astronomy_for_zip(zip)
    stub_request(
      :get,
      "http://api.wunderground.com/api/#{ENV['WU_API_KEY']}/astronomy/q/#{zip}.json"
    ).to_return(
      :status => 200,
      :body => File.read("queries/gaithersburg_astronomy.json"),
      :headers => { 'Content-Type' => 'application/json'}
    )
  end

  def stub_forecast10day_for_zip(zip)
    stub_request(
      :get,
      "http://api.wunderground.com/api/#{ENV['WU_API_KEY']}/forecast10day/q/#{zip}.json"
    ).to_return(
      :status => 200,
      :body => File.read("queries/gaithersburg_ten_day_forecast.json"),
      :headers => { 'Content-Type' => 'application/json'}
    )
  end
end
