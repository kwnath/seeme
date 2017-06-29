json.array! @users do |user|
  json.extract! user, :id, :email, :authentication_token, :avatar, :gender, :created_at
end
