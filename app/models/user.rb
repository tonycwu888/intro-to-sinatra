class User < ActiveRecord::Base

  validates :email, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(h_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.h_password = @password
  end

  def self.authenticate(email, password)
    possible_user = User.find_by(email: email)

    if possible_user.password == password
      return possible_user
    end
    nil
  end

end
