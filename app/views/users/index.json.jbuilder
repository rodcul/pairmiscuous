json.array!(@users) do |user|
  json.extract! user, :id, :username, :full_name, :profile_picture, :slack_username
  json.url user_url(user, format: :json)
end
