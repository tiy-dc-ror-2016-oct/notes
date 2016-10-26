require 'active_record'
require 'sqlite3'
require 'pry'

ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: 'contact.sqlite3'
  })


class Person < ActiveRecord::Base

end

class EmailAddress < ActiveRecord::Base

end


binding.pry

puts "All Done"
