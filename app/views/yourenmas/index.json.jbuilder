json.array!(@yourenmas) do |json, yourenma|
  json.id yourenma.id
  json.user yourenma.user.username
  json.distance yourenma.user.distance_with(current_user)
  json.description yourenma.description
  json.topic yourenma.topic.name
  json.place yourenma.place
end
