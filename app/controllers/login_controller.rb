class LoginController < ApplicationController
	def index
	end

	def create
		user = User.find_by email: params[:email], password: params[:password]
		if user.present?
			cookies[:email] = user.email
			cookies[:uuid] = user.uuid
			redirect_to '/tasks'
		else
			redirect_to '/login'
		end
	end

	def destroy 
		cookies.delete :email
		cookies.delete :uuid
		redirect_to '/login'
	end
end