require "minitest/autorun"
require "minitest/pride"

ENV['RACK_ENV'] = 'test'
require "./app"
require "rack/test"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    App
  end

  def test_can_greet_the_class
    response = get "/greeter"
    assert response.ok?
    assert_equal "Hello, Class", response.body
  end

  def test_can_greet_the_class_with_a_name
    response = get "/greeter", name: "Ben"
    assert response.ok?
    assert_equal "Hello, Ben", response.body
  end
end
