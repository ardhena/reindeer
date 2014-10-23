ActiveAdmin.register Admin do

  permit_params :first_name, :last_name, :email, :country

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :country, :as => :select, :collection => ['Poland', 'Norway']
    end
    f.actions
  end

  index do
    column :first_name
    column :last_name
    column :email
    column :country
    actions
  end

  show do |ad|
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :country
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
