class SignupController < ApplicationController
	def index
	end

	def create
		uuid = SecureRandom.uuid
		User.create!(email: params[:email], password: params[:password], uuid: uuid)
		cookies[:email] = params[:email]
		cookies[:uuid] = uuid
		redirect_to "/tasks"
	end
end