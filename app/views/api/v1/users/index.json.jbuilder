json.array! @users do |user|
  json.extract! user, :id, :email, :nickname, :avatar, :gender, :authentication_token, :created_at
end
