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
    assert_equal 201, last_response.status
    assert_equal Employee.last.id, JSON.parse(last_response.body)["id"]
    assert_equal "Ben", Employee.last.name
  end

  def test_422_response_and_error_message_when_employee_fails_to_save
    header "content_type", "application/json"

    payload = {
      phone: "555-555-5555",
      salary: 50000
    }

    post "/employees", payload.to_json
    assert_equal 422, last_response.status

    assert_equal "Name can't be blank", JSON.parse(last_response.body)['errors']['full_messages'].first

  end

  def test_can_read_all_employees
    get "/employees"
    assert last_response.ok?
    employees = JSON.parse(last_response.body)
    assert_equal 3, employees.size
    assert_equal "Dis Gal", employees.first["name"]
  end

  def test_can_read_single_employee
    get "/employees/#{Employee.last.id}"
    assert last_response.ok?
    assert_equal "Dis Guy", JSON.parse(last_response.body)["name"]
  end

  def test_404_for_employee_not_in_database
    get "/employees/#{Employee.last.id + 1}"
    assert_equal 404, last_response.status
    assert_equal "Employee #{Employee.last.id + 1} not found!", JSON.parse(last_response.body)["message"]
  end

end
