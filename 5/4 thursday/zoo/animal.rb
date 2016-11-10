class Animal < ActiveRecord::Base
  validates :name, presence: true
end
