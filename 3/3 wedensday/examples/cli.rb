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

# begin
#   Migration.migrate(:down)
# rescue
# end
#
# Migration.migrate(:up)

oct_16 = Cohort.create(name: "Ruby October 2016")

binding.pry

oct_16.add_student(Student.create(name: "Ben"))
oct_16.add_student(Student.create(name: "Allie"))
oct_16.add_student(Student.create(name: "Alex"))
oct_16.add_student(Student.create(name: "Farimah"))


picked_student = oct_16.fairly_pick_a_student!
puts picked_student.name


# lambda {}
# -> do end
