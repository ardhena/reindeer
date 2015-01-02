class AddBioToUserProfile < ActiveRecord::Migration
  def up
    add_column :users, :bio, :text
  end

  def down
    remove_column :users, :bio, :text
  end
end
