# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#     names = ['Bob', 'Hamilton', 'George', 'Amanda', 'SmartJay', 'Annoying Maggie', 'SmoothGuy', 'Hamilton', 'Evil Forrest', 'Jessica']

#     sex = [0, 1, 2]

#     email = ['a', 'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'w', 'r']

#     photo = ['https://unsplash.it/200', 'https://unsplash.it/200/300/?random', 'https://unsplash.it/201/301/?random', 'https://unsplash.it/202/302/?random', 'https://unsplash.it/203/303/?random', 'https://unsplash.it/204/304/?random']

#     bios = ['Evil Forrest is Evil', 'I love long walk on the beach', 'I am a sunset watcher', 'The bigger, the better', 'Everything is bigger in Texas ;)']

#     latitude = [4, 10.4, 20.8327, 29.6, 10, 25, 38]


#     10.times do
#     User.create(email: "'#{email.sample}'@gmail.com", nickname: '#{names.sample}', gender: '#{sex.sample}', avatar: '#{photo.sample}', bio: '#{bios.sample}', lat: '#{latitude.sample}', lng: '#{latitude.sample}')
#     end


# (email: "Overseasmansion@gmail.com", password: 123456, nickname: "Shanghai xnode", language: nil, avatar: "https://unsplash.it/200/200/?random\n", admin: false, bio: nil, gender: nil, lat: 31.219830, lng: 121.443782)
# (email: "this@gmail.com", password: 123456, nickname: "Huashan Hospital", language: nil, avatar: "https://unsplash.it/200/200/?random\n", admin: false, bio: nil, gender: nil, lat: 31.217164, lng: 121.443484)


User.create(email: "Overseasmansion@gmail.com", password: 123456, nickname: "Shanghai xnode", language: nil, avatar: "https://unsplash.it/200/200/?random\n", admin: false, bio: nil, gender: 1, lat: 31.219830, lng: 121.443782)
User.create(email: "this@gmail.com", password: 123456, nickname: "Huashan Hospital", language: nil, avatar: "https://unsplash.it/200/200/?random\n", admin: false, bio: nil, gender: 2, lat: 31.217164, lng: 121.443484)
User.create(email: "Something@gmail.com", password: 123456, nickname: "Chair", language: nil, avatar: "https://unsplash.it/200/200/?random\n", admin: false, bio: nil, gender: 1, lat: 31.219830, lng: 121.443781)
User.create(email: "this@gmail.com", password: 123456, nickname: "Table", language: nil, avatar: "https://unsplash.it/200/200/?random\n", admin: false, bio: nil, gender: 2, lat: 31.217164, lng: 121.443483)
