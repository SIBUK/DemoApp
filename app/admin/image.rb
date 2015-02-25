ActiveAdmin.register Image do


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

  permit_params :name, :image, :post_id

  show do |f|
    attributes_table do
      row :name
      row :post_id
      row :thumbnail do
        image_tag(f.image.url(:thumb)) # Will display the image on show object page
      end
    end
  end

  form do |f|
    f.inputs "Images" do
      f.input :name
      f.input :post_id, as: :select, collection: Post.all.map{|w| [w.title, w.id]}, include_blank: false, required: true
      f.input :image, required: false, hint: f.object.image ? image_tag(f.object.image.url(:thumb)) : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end


end
