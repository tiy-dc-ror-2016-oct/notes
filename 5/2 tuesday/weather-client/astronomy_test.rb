require 'minitest/autorun'
require 'minitest/pride'
require './astronomy'
require 'webmock/minitest'
require 'active_support'
require 'active_support/core_ext'

class AstronomyTest < Minitest::Test

  def test_class_exists
    assert Astronomy
  end

  def test_can_access_astronomy_report_for_20877
      stub_request(
        :get,
        "http://api.wunderground.com/api/#{ENV['WU_API_KEY']}/astronomy/q/20877.json"
      ).to_return(
        :status => 200,
        :body => File.read("queries/gaithersburg_astronomy.json"),
        :headers => { 'Content-Type' => 'application/json'}
      )
      astronomy = Astronomy.new.get(20877)
      assert_equal '59', astronomy['moon_phase']['current_time']['minute']
  end

end
