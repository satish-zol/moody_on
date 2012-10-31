class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :about_me, :string
    add_column :users, :dob,      :string
    add_column :users, :hometown, :string
    add_column :users, :location, :string
    add_column :users, :relationships, :string
    add_column :users, :status, :string
    add_column :users, :gender, :string
    
  end
end
