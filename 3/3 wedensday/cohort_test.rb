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
require_relative "pick"


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

  def test_a_chort_can_have_students
    cohort = Cohort.create!(name: "October 2016 Ruby")
    student = Student.create!(name: "moose")

    cohort.add_student(student)

    assert_equal [student], cohort.students
  end

  def test_can_have_a_last_picked_student
    cohort = Cohort.create!(name: "October 2016 Ruby")
    student = Student.create!(name: "moose")

    cohort.add_student(student)

    assert_equal [student], cohort.students
  end

  def test_can_fairly_pick_a_student
    cohort = Cohort.create!(name: "October 2016 Ruby")
    student = Student.create!(name: "moose")

    cohort.add_student(student)
    cohort.fairly_pick_a_student!
    assert_equal Pick.all.count, 1
  end
end
