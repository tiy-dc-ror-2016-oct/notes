require "sinatra"
require "./db/connection"

set :method_override, true

# Homepage
get "/" do
  erb :"home/index.html", layout: :"layout/application.html"
end

# List all Animals # index
get "/animals" do
  @animals = Animal.all
  erb :"animals/index.html", layout: :"layout/application.html"
end

# Show specific animal # show
get "/animals/:id" do
  @animal = Animal.find(params["id"])
  erb :"animals/show.html", layout: :"layout/application.html"
end

# Create Animals # create
post "/animals" do
  @animal = Animal.new(params["animal"])
  if @animal.save
    redirect "/animals"
  else
    erb :"animals/new.html", layout: :"layout/application.html"
  end
end

# show form to create a new animal # new
get "/animals/new" do
  @animal = Animal.new
  erb :"animals/new.html", layout: :"layout/application.html"
end

# show form to edit an existing animal # edit
get "/animals/:id/edit" do
  @animal = Animal.find(params["id"])
  erb :"animals/edit.html", layout: :"layout/application.html"
end

# update a animal based upon an id # update
patch "/animals/:id" do
  @animal = Animal.find(params["id"])
  @animal.update(params["animal"])
  redirect "/animals"
end

# delete a give animal # delete
delete "/animals/:id" do
  Animal.find(params["id"]).destroy
  redirect "/animals"
end

# =====
#

get "/animals/:animal_id/drugs/new" do
  @animal = Animal.find(params["animal_id"])
  @drug = @animal.drugs.build
  erb :"drugs/new.html", layout: :"layout/application.html"
end

post "/drugs" do
  @drug = Drug.new(params["drug"])
  if @drug.save
    redirect "/animals/#{@drug.animal_id}"
  else
    erb :"drugs/new.html", layout: :"layout/application.html"
  end
end
