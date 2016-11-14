class Drug < ActiveRecord::Base
  belongs_to :animal
  validates :name, presence: true
end
