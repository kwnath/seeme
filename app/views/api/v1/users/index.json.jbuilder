json.array! @users do |user|
  json.extract! user, :id, :email, :authentication_token, :created_at
end
