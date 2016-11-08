require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require './app.rb'

class AppTest < Minitest::Test
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  def test_get_a_page_to_ask_for_a_zip
    get "/"
    assert last_response.ok?
    assert_match(/enter your zip/, last_response.body)
  end

  def test_can_lookup_weather_for_a_zip
    post "/weather/for", {zip: "20180"}
    assert_equal last_response.status, 200
    assert_match(/Lovettsville, VA/, last_response.body)
  end

end
