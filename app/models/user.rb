class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    user && user.authenticate(password) ? user : nil
  end
end
