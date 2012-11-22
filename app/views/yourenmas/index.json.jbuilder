json.array!(@yourenmas) do |json, yourenma|
  json.id yourenma.id
  json.user yourenma.user.username
  json.distance number_with_precision(yourenma.user.distance_with(current_user), :precision => 2)
  json.description yourenma.description
  json.topic yourenma.topic.name
  json.place yourenma.place
  json.created_at yourenma.created_at
  json.lat.yourenma.user.lat
  json.lon.yourenma.user.lon
end
