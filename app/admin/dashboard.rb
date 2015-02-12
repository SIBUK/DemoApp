ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "15 most recent posts" do
          table_for Post.order("created_at desc").limit(15) do
            column :id
            column "Title", :name do |post|
              link_to post.title, admin_post_path(post.id)
            end
            column :category, sortable: :category
            column :created_at
          end
          strong (link_to "Show All Posts", admin_posts_path)
        end
      end


      column do
        panel "Categories" do
          table_for Category.order("created_at desc").limit(15) do
            column :id
            column "Name", :name do |category|
              link_to category.name, admin_category_path(category.id)
            end
            column :created_at
          end
          strong (link_to "Show All Categories", admin_categories_path)
        end
      end

    end
  end



end
