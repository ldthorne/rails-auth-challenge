require 'bcrypt'

class User < ActiveRecord::Base
	validates_presence_of :email, :password

	include BCrypt

	before_validation(on: :create) do
    salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(self.password, salt)
    self.salt = salt
  end
end