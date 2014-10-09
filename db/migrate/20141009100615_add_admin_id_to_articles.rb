class AddAdminIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :admin_id, :integer
  end
end
