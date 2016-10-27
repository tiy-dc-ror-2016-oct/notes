employees = employees
exit!
Department.all
:employees
:employees.to_s
s = :employees.to_s
s.singularize
s.singularize.titlecase
s.singularize.titlecase.constantize
s.singularize.titlecase.constantize.new
s.singularize.titlecase.constantize.create(name: 'Russell')
Employee.last
exit!
CreateEmployeesAndDepartmentsMigration.migrate(:up)
exit
Depatment.create("waste")
Department.create("waste")
Department.create(name: "waste")
Employee.create(phone_number: '703-123-1234')
Employee.create(number: '703-123-1234')
Employee.create(phone: '703-123-1234')
exit
Employee.create(phone: '703-123-1234')
Employee.create!(phone: '703-123-1234')
exit
Employee.create!(phone: '703-123-1234')
exit!
Department.all
Department.first.employees << Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00, department_id: a.id)
Department.first.employees << Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
Department.first.employees << Employee.new(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
Employee.create!(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)
exit
d = Department.last
d.destroy
d.errors
e = Employee.create
e.errors
exit!
d = Department.last
d.destroy
exit
