json.array! @users do |user|
  json.extract! user, :id, :email, :avatar, :gender, :nickname, :language, :bio, :created_at, :lat, :lng
end
