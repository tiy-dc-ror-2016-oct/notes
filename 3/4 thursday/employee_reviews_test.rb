require 'minitest/autorun'
require 'pry'
require 'minitest/pride'
require './department'
require './create_employees_and_departments_migration'
require './employee'

ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: 'test.sqlite3'
})

ActiveRecord::Migration.verbose = false
begin
  CreateEmployeesAndDepartmentsMigration.migrate(:down)
rescue
end
CreateEmployeesAndDepartmentsMigration.migrate(:up)

class EmployeeReviews < Minitest::Test

  def setup
    Employee.delete_all
    Department.delete_all
  end

  def test_classes_exist
    assert Department
    assert Employee
  end

  def test_can_create_new_department
    a = Department.create!(name: "Marketing")
    assert a # makes sure it's truthy
    refute_equal nil, a.id
  end

  def test_can_create_new_employee
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    refute_equal nil, new_employee.id
  end

  def test_can_add_employee_to_a_department
    a = Department.create!(name: "Marketing")
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00, department_id: a.id)
    new_employee2 = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00, department_id: a.id)
    assert_equal a.employees, [new_employee, new_employee2]
  end

  def test_can_add_employee_to_a_department
    marketing = Department.create!(name: "Marketing")
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00, department_id: marketing.id)
    assert_equal new_employee.department, marketing
  end

  def test_can_create_a_deparment_for_an_employee
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    waste = new_employee.build_department(name: "Waste Services")

    assert_equal new_employee.department, waste

    new_employee.save

    assert_equal({}, waste.changes)
  end

  def test_can_get_employee_name
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    assert_equal "Dan", new_employee.name
  end

  def test_can_get_employee_salary
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    assert_equal 50000.00, new_employee.salary
  end

  def test_can_get_a_department_name
    a = Department.create!(name: "Marketing")
    assert_equal "Marketing", a.name
  end

  def test_total_department_salary
    a = Department.create!(name: "Marketing")
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    old_employee = Employee.create!(name: "Yvonne", email: "Yvonne@urFired.com", phone: "919-123-4567", salary: 40000.00)
    a.add_employee(new_employee)
    a.add_employee(old_employee)
    assert_equal 90000.00, a.department_salary
  end

  def test_add_employee_review
    xavier = Employee.create!(name: "Xavier", email: "ProfX@marvel.com", phone: "911", salary: 70000.00)
    assert xavier.add_employee_review(positive_review_one)
  end

  def test_set_employee_performance
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    old_employee = Employee.create!(name: "Yvonne", email: "Yvonne@urFired.com", phone: "919-123-4567", salary: 4000.00)
    new_employee.satisfactory = true
    old_employee.satisfactory = false
    assert new_employee.satisfactory
    refute old_employee.satisfactory
  end

  def test_give_raise_by_percent
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    assert_equal 54000, new_employee.raise_by_percent(0.08)
  end

  def test_give_raise_by_amount
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    assert_equal 60000, new_employee.raise_by_amount(10000)
  end

  def test_department_raises_based_on_criteria
    a = Department.create!(name: "Marketing")
    xavier = Employee.create!(name: "Xavier", email: "ProfX@marvel.com", phone: "911", salary: 70000.00)
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    old_employee = Employee.create!(name: "Yvonne", email: "Yvonne@urFired.com", phone: "919-123-4567", salary: 40000.00)
    a.add_employee(xavier)
    a.add_employee(new_employee)
    a.add_employee(old_employee)
    xavier.update(satisfactory: true)
    new_employee.update(satisfactory: true)
    old_employee.update(satisfactory: false)
    a.department_raise(14000.00) {|e| e.satisfactory == true && e.salary < 60000.00}
    assert_equal 70000.00, xavier.reload.salary
    assert_equal 64000.00, new_employee.reload.salary
    assert_equal 40000.00, old_employee.reload.salary
  end

  def test_evaluate_employee_review
    xavier = Employee.create!(name: 'Xavier', email: 'ProfX@marvel.com', phone: '911', salary: 70000.00)
    xavier.add_employee_review(positive_review_one)
    assert xavier.satisfactory
  end

  def test_total_department_employees
    a = Department.create!(name: "Marketing")
    xavier = Employee.create!(name: "Xavier", email: "ProfX@marvel.com", phone: "911", salary: 70000.00)
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    old_employee = Employee.create!(name: "Yvonne", email: "Yvonne@urFired.com", phone: "919-123-4567", salary: 40000.00)
    a.add_employee(xavier)
    a.add_employee(new_employee)
    a.add_employee(old_employee)
    assert_equal 3, a.total_department_employees
  end

  def test_least_paid_employee
    a = Department.create!(name: "Marketing")
    xavier = Employee.create!(name: "Xavier", email: "ProfX@marvel.com", phone: "911", salary: 70000.00)
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    old_employee = Employee.create!(name: "Yvonne", email: "Yvonne@urFired.com", phone: "919-123-4567", salary: 40000.00)
    a.add_employee(xavier)
    a.add_employee(new_employee)
    a.add_employee(old_employee)
    assert_equal old_employee, a.least_paid_employee
  end

  def test_sort_employees_alphabetically
    a = Department.create!(name: "Marketing")
    xavier = Employee.create!(name: "Xavier", email: "ProfX@marvel.com", phone: "911", salary: 70000.00)
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    old_employee = Employee.create!(name: "Yvonne", email: "Yvonne@urFired.com", phone: "919-123-4567", salary: 40000.00)
    a.add_employee(xavier)
    a.add_employee(new_employee)
    a.add_employee(old_employee)
    assert_equal [new_employee, xavier, old_employee], a.sort_employees_alphabetically
  end

  def test_employees_higher_than_average_salary
    a = Department.create!(name: "Marketing")
    xavier = Employee.create!(name: "Xavier", email: "ProfX@marvel.com", phone: "911", salary: 70000.00)
    new_employee = Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
    old_employee = Employee.create!(name: "Yvonne", email: "Yvonne@urFired.com", phone: "919-123-4567", salary: 40000.00)
    a.add_employee(xavier)
    a.add_employee(new_employee)
    a.add_employee(old_employee)
    assert_equal [xavier], a.employees_higher_than_average_salary
  end

  private def negative_review_one
    "Zeke is a very positive person and encourages those around him, but he has not done well technically this year. There are two areas in which Zeke has room for improvement. First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required. This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion. Second, when discussing new requirements with project managers, less of the information is retained by Zeke long-term than is expected. This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate. This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further."
  end

  private def negative_review_two
    "Thus far, there have been two concerns over Yvonne's performance, and both have been discussed with her in internal meetings. First, in some cases, Yvonne takes longer to complete tasks than would normally be expected. This most commonly manifests during development on existing applications, but can sometimes occur during development on new projects, often during tasks shared with Andrew. In order to accommodate for these preferences, Yvonne has been putting more time into fewer projects, which has gone well. Second, while in conversation, Yvonne has a tendency to interrupt, talk over others, and increase her volume when in disagreement. In client meetings, she also can dwell on potential issues even if the client or other attendees have clearly ruled the issue out, and can sometimes get off topic."
  end

  private def positive_review_one
    "Xavier is a huge asset to SciMed and is a pleasure to work with. He quickly knocks out tasks assigned to him, implements code that rarely needs to be revisited, and is always willing to help others despite his heavy workload. When Xavier leaves on vacation, everyone wishes he didn't have to go. Last year, the only concerns with Xavier performance were around ownership. In the past twelve months, he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts with estimates on Acme, clients are happy with his work and responsiveness, which is everything that his managers could ask for."
  end

  private def positive_review_two
    "Wanda has been an incredibly consistent and effective developer.  Clients are always satisfied with her work, developers are impressed with her productivity, and she's more than willing to help others even when she has a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys working with her.  During the past year, she has largely been devoted to work with the Cement Company, and she is the perfect woman for the job.  We know that work on a single project can become monotonous, however, so over the next few months, we hope to spread some of the Cement Company work to others.  This will also allow Wanda to pair more with others and spread her effectiveness to other projects."
  end
end
