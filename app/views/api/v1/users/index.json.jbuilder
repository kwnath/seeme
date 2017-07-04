json.array! @users do |user|
  json.extract! user, :id, :email, :avatar, :gender, :nickname, :language, :created_at, :lat, :lng, :tag_list, :bio
end
