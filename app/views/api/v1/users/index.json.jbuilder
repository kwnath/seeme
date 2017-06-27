json.array! @users do |user|
  json.extract! user, :email, :authentication_token, :created_at
end
