ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :price, :description, :weight, :screen, :memory, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :description, :weight, :screen, :memory]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  remove_filter :image_attachment, :image_blob

  show do
    attributes_table do
      row :created_at
      row :updated_at
      row :name
      row :price
      row :description
      row :weight
      row :screen
      row :memory
      row :image do |ad|
        if ad.image.attached?
          image_tag url_for(ad.image)
        else
          "No image attached"
        end
      end
      active_admin_comments
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :description
      f.input :weight
      f.input :screen
      f.input :memory
      f.input :image, as: :file
    end
    actions
  end

end
