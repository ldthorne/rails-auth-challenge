class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :description
    	t.date :due_date
    	t.boolean :is_complete, default: false
    	t.belongs_to :user
    end
  end
end
