class User < ApplicationRecord
  has_secure_password
  has_many :books

  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username
end
