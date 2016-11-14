class Animal < ActiveRecord::Base
  validates :name, presence: true
  has_many :drugs
  has_many :friends, foreign_key: :outgoing_animal_id
end
