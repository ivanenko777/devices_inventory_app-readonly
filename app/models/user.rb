class User < ApplicationRecord
  cattr_accessor :curr_user

  has_secure_password

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
end
