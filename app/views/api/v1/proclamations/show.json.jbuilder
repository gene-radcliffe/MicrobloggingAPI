json.proclaimed_by User.find(@proclamation.user_id).username
json.(@proclamation, :user_id, :body, :id, :created_at)
json.comments do
  json.array!(@proclamation.comments) do |comment|
    json.commented_by User.find(comment.user_id).username
    json.(comment, :user_id, :body, :id, :created_at)
  end
end