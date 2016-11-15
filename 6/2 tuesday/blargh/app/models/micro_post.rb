class MicroPost < ActiveRecord::Base
  validates :title, presence: true
end
