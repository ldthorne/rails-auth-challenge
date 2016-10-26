class Task < ActiveRecord::Base
	validates_presence_of :description, :due_date
end