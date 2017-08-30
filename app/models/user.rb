class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  VALID_USERNAME = /\A[a-z][a-z\-\_]+[a-z]\z/i
  validates :username, presence: true, length: { minimum: 4 },
		       format: { with: VALID_USERNAME },
		       uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }
end
