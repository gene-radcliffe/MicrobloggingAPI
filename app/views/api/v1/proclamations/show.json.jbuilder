json.proclamation do
    json.proclamation_id @proclamation.id
    json.username @proclamation.user.username
    json.body @proclamation.body
end