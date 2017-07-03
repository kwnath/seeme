# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



    names = ['Bob', 'Hamilton', 'George', 'Amanda', 'SmartJay', 'Annoying Maggie', 'SmoothGuy', 'Hamilton', 'Evil Forrest', 'Jessica']

    sex = [0, 1, 2]

    photo = ['https://unsplash.it/200', 'https://unsplash.it/200/300/?random', 'https://unsplash.it/201/301/?random', 'https://unsplash.it/202/302/?random', 'https://unsplash.it/203/303/?random', 'https://unsplash.it/204/304/?random']

    bios = ['Evil Forrest is Evil', 'I love long walk on the beach', 'I am a sunset watcher', 'The bigger, the better', 'Everything is bigger in Texas ;)']



    10.times do
    User.create(email: 'blabla@gmail.com', nickname: '#{names.sample}', gender: '#{sex.sample}', avatar: '#{photo.sample}', bio: '#{bios.sample}')
    end

#, bio: '#{bios.sample}'
