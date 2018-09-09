json.array!(@proclamations) do |proclamation|
  json.proclaimed_by User.find(proclamation.user_id).username
  json.user_id proclamation.user_id
  json.body proclamation.body
  json.proclamation_id proclamation.id
  json.created proclamation.created_at
end