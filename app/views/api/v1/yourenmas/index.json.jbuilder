json.array!(@yourenmas) do |json, yourenma|
  json.id yourenma.id
  json.user yourenma.user.username
  json.description yourenma.description
  json.topic yourenma.topic.name
  json.place yourenma.place
end
