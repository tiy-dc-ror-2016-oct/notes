class Friend < ActiveRecord::Base
  belongs_to :outgoing_animal, class_name: "Animal"
  belongs_to :shy_animal, class_name: "Animal"
end
