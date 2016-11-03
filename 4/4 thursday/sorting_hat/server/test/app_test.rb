require_relative "test_helper"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    App
  end

  def test_create_a_user_through_the_api

    payload = {name: "RusseelDAASDADSD",
    email: "russell@theironyar.dom"}

    post "/api/users", payload.to_json

    assert_equal "RusseelDAASDADSD",  User.last.name
  end
end
