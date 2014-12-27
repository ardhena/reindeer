class AddUserInfoToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :country, :string
    add_column :users, :country, :integer #enumb
    add_column :users, :school, :integer #enum
    add_column :users, :sex, :integer #enum
    add_column :users, :city, :string
  end
end
