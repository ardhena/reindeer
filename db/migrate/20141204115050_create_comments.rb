class CreateComments < ActiveRecord::Migration
  def change
    create_table :news_comments do |t|
    	t.text :content
    	t.integer :user_id
    	t.integer :new_id

    	t.timestamps
    end
  end
end
