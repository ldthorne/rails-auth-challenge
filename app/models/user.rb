require 'bcrypt'

class User < ActiveRecord::Base
	validates_presence_of :email, :password

	include BCrypt

	def valid_password?(plaintext_password)
		db_password = Password.new(password)
		db_password == plaintext_password
	end

	before_validation(on: :create) do
		self.password = Password.create(self.password)
  end
end