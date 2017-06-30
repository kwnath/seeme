json.array! @users do |user|
  json.extract! user, :id, :email, :authentication_token, :avatar, :gender, :nickname, :language, :created_at
end
