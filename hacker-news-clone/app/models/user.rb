class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :post_votes
  has_many :comment_votes

  validates_presence_of :username, :password


  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
