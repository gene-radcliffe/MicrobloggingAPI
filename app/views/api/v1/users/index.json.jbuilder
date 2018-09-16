json.array!(@users) do |user|
  json.username user.username
  json.user_id user.id
  json.created user.created_at
end