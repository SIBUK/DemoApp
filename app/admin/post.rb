ActiveAdmin.register Post do



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
  permit_params :title, :body, :category_id, :posttype, :url, :quoteauthor, :song, :artist, :album, :image


  index do
    column("Title", :title, :sortable => :title)  {|post| link_to "#{post.title}", admin_post_path(post) }
    #column("Email", :email) do |user|
    #  link_to "#{user.email}", "mailto:#{user.name}<#{user.email}>?subject=Enquiry"
    #end
    column("Created", :created_at)
    actions
  end

  show do |f|
    attributes_table do
      row :title
      row :body
      row :posttype, collection: Post.posttypes.keys.to_s.capitalize
      row :created_at
      row :thumbnail do
        image_tag(f.image.url(:thumb)) # Will display the image on show object page
      end
      row :url
      row :quoteauthor
      row :song
      row :artist
      row :album
    end
  end

  form do |f|
    f.inputs "Post Details" do
      f.input :title
      f.input :body
      f.input :category_id
      f.input :posttype, :as => :select, collection: Post.posttypes.keys.to_a
      f.input :url
      f.input :quoteauthor
      f.input :song
      f.input :artist
      f.input :album
      f.input :image, required: false, as: :file, hint: image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end


end
