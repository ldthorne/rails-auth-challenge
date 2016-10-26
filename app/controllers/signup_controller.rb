class SignupController < ApplicationController
	def index
	end

	def create
		uuid = SecureRandom.uuid
		User.create!(email: params[:email], password: params[:password], uuid: uuid)
		session[:uuid] = uuid
		session[:email] = params[:email]
		redirect_to "/tasks"
	end
end