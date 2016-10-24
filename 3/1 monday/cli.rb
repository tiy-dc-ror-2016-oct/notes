require_relative "cohort"
require_relative "student"

oct_16 = Cohort.new

oct_16.add_student(Student.new("Ben"))
oct_16.add_student(Student.new("Allie"))
oct_16.add_student(Student.new("Alex"))
oct_16.add_student(Student.new("Farimah"))


picked_student = oct_16.fairly_pick_a_student!
puts picked_student.name



# lambda {}
# -> do end
