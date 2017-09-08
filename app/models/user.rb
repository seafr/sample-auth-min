class User < ActiveRecord::Base
  before_save { self.username = username.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_USERNAME = /\A[a-z][a-z0-9\-\_]+[a-z0-9]\z/i
  validates :username, presence: true, length: { minimum: 4 },
		       format: { with: VALID_USERNAME },
		       uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }
end
