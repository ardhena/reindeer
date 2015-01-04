ActiveAdmin.register User do
  decorate_with UserDecorator
  menu label: 'Users'

  index do
    column :email
    column :first_name
    column :last_name
    column :sex
    column :birth
    column :country
    actions defaults: false do |user|
      link_to "View", admin_panel_user_path(user)
    end
  end

  show do |user|
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :sex
      row :birth
      row :country
      row :school
      row :city
      row :bio
      row :interest_list
      row :language_list
    end
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
