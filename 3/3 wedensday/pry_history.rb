eval("1+1")
eval("`say i ran a system command from a string`")
exit
Array.shuffle!
ri Array.shuffle!
exit
nil.empty?
exit
LAST_PICKED_PATH = "./last_student.txt"
File.read(LAST_PICKED_PATH)
exit
db
ls db
db.execute("select * from students")
db.execute("select * from students where id = 2")
def find(db, id)
  db.execute("select * from students where id = #{id}")
end
find(db, 3)
find(db, 1)
find(db, 5)
exit
Student.find(1)
exit!
Student.find(3)
Student.find(3).first
exit
Student.find(2)
Student.find(4)
Student.find(6)
Student.find(4)
Student.find(5)
Student.new("Moose")
Student.new("Moose").save
exit!
Student.new("mmooooooooose")
a = _
a.save
exit
a = Student.new("mmooooooooose")
a.save
Student.find(6)
exit
Student.new("Powerline")
a = _
a.save
exit!
Student.new("Gridley")
a = _ 
a.save
exit!
Student.new("Gridley").save
exit!
Student.new("Missy")
Student.new("Missy").save
Student.find(9)
help
pry-backtrace
help
wtf?
exit!
self.class
self
exit!
Student.find(9)
exit!
oct_16
Student
Student.all
Student.create(name: "Ben"))
Student.create(name: "Allie"))
Student.create(name: "Alex"))
Student.create(name: "Farimah")
Student.create(name: "Alex")
Student.create(name: "Allie")
Student.create(name: "Ben")
exit
exit!
Student.create(name: "Ben")
Student.create(name: "Allie")
Student.create(name: "Alex")
Student.create(name: "Farimah")
Student.all
exit!
exit
require 'active_record'
class Ben < ActiveRecord::Base; end
Ben.methods
new_methods = Ben.methods - Object.methods
new_methods.size
new_methods = Ben.new.methods - Object.methods
exit
