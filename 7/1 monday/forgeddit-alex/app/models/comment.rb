class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :content
  scope :reversed, -> { order 'created_at DESC' }
end
