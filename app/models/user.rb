class User < ActiveRecord::Base
  has_secure_password

  validates :password, presence: true
  validates :username, uniqueness: true, presence: true

  has_many :articles
  has_many :comments
end
