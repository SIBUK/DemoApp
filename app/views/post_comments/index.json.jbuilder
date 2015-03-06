json.array!(@post_comments) do |post_comment|
  json.extract! post_comment, :id, :name, :email, :body, :post_id, :post_comment_id
  json.url post_comment_url(post_comment, format: :json)
end
