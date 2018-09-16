json.array! @followers do |follower|
    json.extract! follower, :id, :username
  end