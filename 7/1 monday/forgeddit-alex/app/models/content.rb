class Content < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  scope :reversed, -> { order 'created_at DESC' }
end
