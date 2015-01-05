ActiveAdmin.register Article do

  scope_to :current_admin
  permit_params :title, :content
  filter :title
  filter :content

  controller do
    def create
      params[:article] = params.require(:article).permit(:title, :content)
      @article = Article.new(params[:article])
      @article.admin = current_admin
      super
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :ckeditor, input_html: { ckeditor: { toolbar: 'Mini'} }
    end
    f.actions
  end

  index do
    column :title
    column :content
    actions
  end

  show do |article|
    attributes_table do
      row :title
      row :content
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
