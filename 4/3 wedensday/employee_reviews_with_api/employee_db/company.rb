class Company < ActiveRecord::Base
  has_many :departments

  has_many :employees, through: :departments
  # def employees
  #   e = []
  #   self.departments.each do |d|
  #     e += d.employees
  #   end
  #   e
  # end
end
