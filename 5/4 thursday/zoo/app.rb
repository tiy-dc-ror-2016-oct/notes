require "sinatra"
require "./db/connection"

set :method_override, true

# Homepage
get "/" do
  erb :"home/index.html", layout: :"layout/application.html"
end

# List all Animals
get "/animals" do
  @animals = Animal.all
  erb :"animals/index.html", layout: :"layout/application.html"
end

# Create Animals
post "/animals" do
  @animal = Animal.new(params)
  if @animal.save
    redirect "/animals"
  else
    erb :"animals/new.html", layout: :"layout/application.html"
  end
end

get "/animals/new" do
  @animal = Animal.new
  erb :"animals/new.html", layout: :"layout/application.html"
end

delete "/animals/:id" do
  Animal.find(params["id"]).destroy
  redirect "/animals"
end
