require 'minitest/autorun'
require 'minitest/pride'
require './conditions'
require 'webmock/minitest'
require 'active_support'
require 'active_support/core_ext'

class ConditionsTest < Minitest::Test

  def test_class_exists
    assert Conditions
  end

  def test_can_access_current_conditions_for_20877
      stub_request(
        :get,
        "http://api.wunderground.com/api/#{ENV['WU_API_KEY']}/conditions/q/20877.json"
      ).to_return(
        :status => 200,
        :body => File.read("queries/gaithersburg_current_conditions.json"),
        :headers => { 'Content-Type' => 'application/json'}
      )
      conditions = Conditions.new.get(20877)
      assert_equal 54.7, conditions['current_observation']['temp_f']
  end

end
