require 'bcrypt'

class User < ActiveRecord::Base
	validates_presence_of :email, :password

	include BCrypt

	def valid_password?(plaintext_password)
		BCrypt::Engine.hash_secret(plaintext_password, salt) == password
	end

	before_validation(on: :create) do
    salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(self.password, salt)
    self.salt = salt
  end
end