class User < ApplicationRecord
  has_secure_token :auth_token
  has_secure_password
  has_many :proclamations
  has_many :comments
  has_many :follows

end
