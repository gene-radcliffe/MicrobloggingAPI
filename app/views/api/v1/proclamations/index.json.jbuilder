json.array!(@proclamations) do |proclamation|
  json.proclaimed_by User.find(proclamation.user_id).username
  json.(proclamation, :user_id, :body, :id, :created_at)
end