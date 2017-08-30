class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { minimum: 4 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }
end
