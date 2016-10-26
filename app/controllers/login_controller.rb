class LoginController < ApplicationController
	def index
	end

	def create
		user = User.find_by email: params[:email], password: params[:password]
		if user.present?
			session[:uuid] = user.uuid
			session[:email] = user.email
			redirect_to '/tasks'
		else
			redirect_to '/login'
		end
	end

	def destroy 
		reset_session
		redirect_to '/login'
	end
end