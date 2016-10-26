class SuperRecord

  def table_name
    raise "Subclasses of superrecord must define a method .table_name that returns the name of the table to interact with!"
  end

  def save
    self.class.db.execute("INSERT INTO #{self.class.table_name} (name)
            VALUES (?)", [@name])
  end

  def self.db
    SQLite3::Database.new "class.sqlite3"
  end

  def self.find(id)
    result = db.execute("select * from #{table_name} where id = #{id}").first
    self.new(result[1])
  end
end
