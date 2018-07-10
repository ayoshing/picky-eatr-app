class User < ApplicationRecord
  has_many :preferences
  has_many :cuisines, through: :preferences
  has_many :favorites
  has_many :restaurants, through: :favorites

  def password=(plaintext_password)
    self.password_digest = Bcrypt::Password.create(plaintext_password)
  end
end
