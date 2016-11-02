require_relative "dependencies"

class App < Sinatra::Base

  post "/employees" do
    text = request.body.read
    employee_info = JSON.parse(text)
    content_type("application/json")
    Employee.create!(employee_info).to_json
  end

  get "/employees" do
    content_type("application/json")
    Employee.all.to_json
  end



  run! if app_file == $PROGRAM_NAME
end
