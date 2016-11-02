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
    Employee.create!(name: "Dis Gal")
    Employee.create!(name: "Dat Gal")
    Employee.create!(name: "Dis Guy")
  end

  def test_can_create_employee
    header "content_type", "application/json"

    payload = {
      name: "Ben",
      email: "bmangelsen@gmail.com",
      phone: "555-555-5555",
      salary: 50000
    }

    post "/employees", payload.to_json
    assert last_response.ok?
    assert_equal Employee.last.id, JSON.parse(last_response.body)["id"]
    assert_equal "Ben", Employee.last.name
  end

  def test_can_read_all_employees
    get "/employees"
    assert last_response.ok?
    employees = JSON.parse(last_response.body)
    assert_equal 3, employees.size
    assert_equal "Dis Gal", employees.first["name"]
  end

end
