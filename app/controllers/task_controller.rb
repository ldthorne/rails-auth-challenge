class TaskController < ApplicationController
	before_action :ensure_authenticated

	def index
		user = User.find_by uuid: session[:uuid]
		@tasks = Task.where(user_id: user.id)
	end

	def create
		user = User.find_by uuid: session[:uuid]
		due_date = Date.parse(params[:due_date])
		Task.create!(due_date: due_date, description: params[:description], user_id: user.id)
		redirect_to '/'
	end

	def update
		task = Task.find(params[:id])
		task.is_complete = !task.is_complete
		task.save!
		redirect_to '/'
	end

	private

	def ensure_authenticated
		user = User.find_by uuid: session[:uuid]
		if !user.present?
			redirect_to '/login'
		end
	end
end