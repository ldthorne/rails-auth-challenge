class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :unique => true
      t.string :password_digest
      t.string :uuid
    end
  end
end
