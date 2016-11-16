# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
user = User.create(full_name: "Russell Osborne", email: "russell@theironyard.com")
user.micro_posts.create(title: 'See the world with ruby colored glasses', content: 'blah blah blah')

10.times do
  user.micro_posts.create(title: FFaker::Book.title, content: FFaker::Book.description)
end
