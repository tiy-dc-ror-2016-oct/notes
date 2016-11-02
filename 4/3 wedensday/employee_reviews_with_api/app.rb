require_relative "dependencies"

class App < Sinatra::Base

  post "/employees" do
    text = request.body.read
    employee_info = JSON.parse(text)
    content_type("application/json")
    employee = Employee.new(employee_info)

    if employee.save
      status 201
      employee.to_json
    else
      status 422
      {
        errors: {
          full_messages: employee.errors.full_messages,
          messages: employee.errors.messages
        }
      }.to_json
    end
  end

  get "/employees" do
    content_type("application/json")
    Employee.all.to_json
  end

  get "/employees/:id" do
    employee = Employee.find_by(id: params["id"])
    if employee
      employee.to_json
    else
      status(404)
      {message: "Employee #{params["id"]} not found!"}.to_json
    end
  end

  run! if app_file == $PROGRAM_NAME
end
