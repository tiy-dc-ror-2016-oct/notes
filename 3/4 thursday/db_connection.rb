require 'active_record'

ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: 'employee_reviews.sqlite3'
})

 ActiveRecord::Base.logger = Logger.new(STDOUT)
