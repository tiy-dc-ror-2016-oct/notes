require 'active_record'

class Department < ActiveRecord::Base
  has_many :employees, dependent: :restrict_with_exception

  def add_employee(new_employee)
    employees << new_employee
  end

  # def employees
  #   Employee.where(department_id: self.id)
  # end

  def department_salary
    employees.reduce(0.0) {|sum, e| sum + e.salary}
  end

  def department_raise(alloted_amount)
    raise_eligible = employees.select {|e| yield(e)}
    amount = alloted_amount / raise_eligible.length
    raise_eligible.each {|e| e.raise_by_amount(amount)}
  end

  def total_department_employees
    employees.count
  end

  def least_paid_employee
    employees.order(salary: :asc).limit(1).first
  end

  def sort_employees_alphabetically
    employees.order(name: :asc)
  end

  def employees_higher_than_average_salary
    # employees = employees
    # average = department_salary / employees.count
    # higher_than_average = []
    # employees.each do |employee|
    #   if employee.salary > average
    #     higher_than_average << employee
    #   end
    # end
    # higher_than_average
    #
    avg = employees.average(:salary)
    employees.where("salary > ?", avg)
  end

end
