class AddCountryToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :country, :string
  end
end
