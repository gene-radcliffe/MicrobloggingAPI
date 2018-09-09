json.array! @proclamations do |proclamation|
    json.username proclamation.user.username
    json.body proclamation.body
end
