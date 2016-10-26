require 'minitest/autorun'
require 'minitest/pride'

require "sqlite3"
require "pry"
require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'class.sqlite3'
)

require_relative "migration"
require_relative "cohort"
require_relative "student"


class CohortTest < Minitest::Test
  def setup
    begin
      Migration.migrate(:down)
    rescue
    end

    Migration.migrate(:up)
  end

  def test_can_create_a_cohort
    assert Cohort.create!(name: "October 2016 Ruby")
  end

  def test_can_add_a_student_to_a_cohort
    cohort = Cohort.create!(name: "October 2016 Ruby")
    student = Student.create!(name: "moose")

    cohort.add_student(student)

    refute_equal nil, student.cohort_id
  end
end
