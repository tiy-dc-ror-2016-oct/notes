class Department < ActiveRecord::Base
  has_many :employees, dependent: :restrict_with_exception

  def department_salary
    employees.reduce(0.0) {|sum, e| sum + e.salary}
  end

  def department_raise(alloted_amount)
    raise_eligible = employees.select {|e| yield(e)}
    amount = alloted_amount / raise_eligible.length
    raise_eligible.each {|e| e.raise_by_amount(amount)}
  end

  def number_of_employees
    self.employees.length
  end

  def lowest_paid_employee
    #Ruby
    lowest = self.employees.sort_by {|e| e.salary}
    return lowest.first

    #SQL
    # self.employees.order(:salary).first
  end

end
