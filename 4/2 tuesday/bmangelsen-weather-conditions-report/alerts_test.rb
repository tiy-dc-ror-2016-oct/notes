require 'minitest/autorun'
require 'minitest/pride'
require './alerts'
require 'webmock/minitest'
require 'active_support'
require 'active_support/core_ext'

class AlertsTest < Minitest::Test

  def test_class_exists
    assert Alerts
  end

  def test_can_access_astronomy_report_for_20877
      stub_request(
        :get,
        "http://api.wunderground.com/api/#{ENV['WU_API_KEY']}/alerts/q/59261.json"
      ).to_return(
        :status => 200,
        :body => File.read("queries/montana_alerts.json"),
        :headers => { 'Content-Type' => 'application/json'}
      )
      alerts = Alerts.new.get(59261)
      assert_equal '1477903980', alerts['alerts'][0]['date_epoch']
  end

end
