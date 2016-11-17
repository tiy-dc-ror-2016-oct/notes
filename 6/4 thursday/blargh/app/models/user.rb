class User < ApplicationRecord
  has_many :micro_posts


  def password
    @_password ||= BCrypt::Password.new(password_hash)
  end

  def password=(unhashed_password)
    @_password = BCrypt::Password.create(unhashed_password)
    self.password_hash = @_password
  end
end
