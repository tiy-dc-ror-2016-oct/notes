Person
ls Person
exit!
ls Person
Person.first
Person.first.to_sql
Person.all
Person.all.to_sql
Person.all.where(first_name: "Watson")
russell = Person.new
russell.attributes
russell.first_name
russell.first_name = "Russell"
russell 
russell.id = 1001
russell.id = nil
russell.last_name = "Osborne"
russell.save
russell
exit
russell
russell = Person.find(1001)
russell.object_id
Person.find(1001).to_sql
Person.find(1001).object_id
russell = Person.find(1001)
russell.instance_variables
russell.instance_variable_set(:@favorite_food, "Sushi")
russell = Person.find(1001)
russell.instance_variables
Person.where({"last_name" => "smith"})
Person.where({"last_name" => "Smith"})
Person.where({"last_name" => "Smith"}).to_sql
Person.where("LEN(last_name) > 4").to_sql
Person.where("LEN(last_name) > 4")
Person.where("LENGTH(last_name) > 4")
Person.where("LENGTH(last_name) > 4").where("LENGTH(last_name) < 7")
Person.where("LENGTH(last_name) > 4").where("LENGTH(last_name) < 7").to_sql
Person.where("LENGTH(last_name) > 4").where("LENGTH(last_name) < 7").count
Person.where("LENGTH(last_name) > 4").where("LENGTH(last_name) < 7").group(:last_name)
Person.where("LENGTH(last_name) > 4").where("LENGTH(last_name) < 7").group(:last_name).count
Person.where("LENGTH(last_name) > 4").where("LENGTH(last_name) < 7").group(:last_name).to_sql
Person.where("LENGTH(last_name) > 4").where("LENGTH(last_name) < 7").group(:last_name).count
exit
