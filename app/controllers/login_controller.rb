class LoginController < ApplicationController
	def index
	end

	def create
		user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

		if user
			session[:uuid] = user.uuid
			session[:email] = user.email
			redirect_to '/'
		else
			redirect_to '/login'
		end
	end

	def destroy 
		reset_session
		redirect_to '/login'
	end
end