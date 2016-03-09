class User < ActiveRecord::Base
  has_many :entries
  validates_presence_of :username, :password, :first_name, :last_name

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
