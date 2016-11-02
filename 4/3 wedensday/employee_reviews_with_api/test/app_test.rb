require "./test/test_helper"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    App
  end

  def setup
    begin CompanyDataMigration.migrate(:down);
    rescue; end
    CompanyDataMigration.migrate(:up)
  end

  def test_can_create_employee
    request_body = {name: "Ben", email: "bmangelsen@gmail.com", phone: "555-555-5555", salary: 50000}.to_json
    new_employee = post("/create_employee", request_body)
    assert new_employee.ok?
    assert_equal Employee.last.id, JSON.parse(new_employee.body)["id"]
    assert_equal "Ben", Employee.last.name
  end

end
