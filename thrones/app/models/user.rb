class User < ActiveRecord::Base
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
  #returns a user if login is successful, and nil otherwise
  def self.attempt_login(name, password_guess)
    user = self.find_by_name(name)
    if user 
      user = nil unless user.password == password_guess
    end
    user
  end
end
