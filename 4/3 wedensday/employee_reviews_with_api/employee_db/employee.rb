require 'active_record'

class Employee < ActiveRecord::Base
  belongs_to :department

  # validates :name, presence: true #uniqueness: true
  # validates :email, presence: true

  def add_employee_review(input)
    self.review = input
    positive_matches = 0
    negative_matches = 0

    positive = [/positive/i, /initiative/i, /great/i, /good/i, /helpful/i,
               /puntual/i, /positive/i, /encourage/i, /beneficial/i, /meets/i,
               /good/i, /(team player)/i, /(hard working)/i, /helps/i, /impressed/i, /impressive/i, /fast/i, /asset/i, /leadership/i, /leader/i, /efficient/i, /(willing to help)/i, /successfully/i,
               /pleasure/i]

    negative = [/negative/i, /lazy/i, /bad/i, /stubborn/i, /(misses deadlines)/i,
               /late/i, /concerns/i, /difficulty/i, /struggles/i, /limitations/i,
               /inconsistent/i, /inefficient/i, /(not done well)/i, /poorly/i,
               /badly/i, /rude/i, /(off topic)/i, /lack/i, /inadequate/i, /limitation/i, /(room for improvement)/i, ]
    positive.each do |r|
      matches = review.scan(r).count
      positive_matches += matches
    end
    negative.each do |r|
      matches = review.scan(r).count
      negative_matches += matches
    end
    self.satisfactory = (positive_matches > negative_matches)
  end

  def set_employee_performance(boolean)
    self.satisfactory = boolean
  end

  def raise_by_percent(raise_percentage)
    self.salary += (salary * raise_percentage)
  end

  def raise_by_amount(raise_amount)
    self.salary += raise_amount
  end

  def self.paid_less_than_average
    #Ruby
    # all_employees = Employee.all
    #
    # # total = 0.0
    # # all_employees.each do |e|
    # #   total += e.salary
    # # end
    # total = all_employees.reduce(0.0) {|sum, e| sum + e.salary}
    #
    # count = all_employees.length
    # average = total / count
    #
    # # low_employees = []
    # # all_employees.each do |e|
    # #   low_employees << e if e.salary < average
    # # end
    # all_employees.to_a.select {|e| e.salary < average}

    #SQL
    # Employee.where("salary < ?", Employee.sum(:salary)/Employee.count)
    # self.where("salary < ?", self.sum(:salary)/self.count)
    where("salary < ?", sum(:salary)/count)
  end
end









#
