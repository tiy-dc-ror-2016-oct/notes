require "sinatra"
require "./db/connection"

get "/" do
  erb :"home/index.html", layout: :"layout/application.html"
end

get "/animals" do
  @animals = Animal.all
  erb :"animals/index.html", layout: :"layout/application.html"
end

post "/animals" do
  @animal = Animal.new(params)
  if @animal.save
    redirect "/animals"
  else
    erb :"animals/new.html", layout: :"layout/application.html"
  end
end
