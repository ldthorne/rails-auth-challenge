require 'bcrypt'
class LoginController < ApplicationController
	def index
	end

	def create
		user = User.find_by email: params[:email]
		if user.present?
			if BCrypt::Engine.hash_secret(params[:password], user.salt) != user.password 
				redirect_to '/login'
			else
				session[:uuid] = user.uuid
				session[:email] = user.email
				redirect_to '/'
			end
		else
			redirect_to '/login'
		end
	end

	def destroy 
		# reset_session
		session.clear
		redirect_to '/login'
	end
end