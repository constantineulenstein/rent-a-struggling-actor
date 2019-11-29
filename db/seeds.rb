# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Trademark.destroy_all

20.times do |i|
  user = User.create!(email: Faker::Internet.email,
              password: "123456",
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              username: Faker::Internet.username,
              gender: Faker::Gender.binary_type,
              age: rand(18..80),
              location: Faker::Address.city,
              description: "I have appeared in many films, television shows, and worked on theatre production. You may have heard of these productions if you are based in Europe. My ability to act has been recognized by Berlin's board of actors with an actor's award. I have also studied at a school. I can be reached at my home or mobile number.",
              actor: true)

  gender = user.gender == "Male" ? "men" : "women"
  url = "https://randomuser.me/api/portraits/#{gender}/#{i}.jpg"

  user.remote_photo_url = url
  user.save!

  2.times do
    Trademark.create(skill: ["Sewing","Tearing an apple in half with your hands","Dressing well", "Flipping eggs in a frying pan","Magic tricks", "Origami", "Juggling","Using chopsticks","Parallel Parking","Preparing a basic meal"].sample, user_id: user.id, price_per_hour: (10..1000).to_a.sample)
  end
end


User.create(email: "user@gmail.com",
            password: "123456",
            first_name: "Test",
            last_name: "User",
            username: "TestUser",
            )

zhang = User.create(email: "zhang@gmail.com",
                  password: "123456",
                  first_name: "Ziyi",
                  last_name: "Zhang",
                  username: "ZiZi",
                  gender: "Female",
                  age: 29,
                  location: "Beijing",
                  description: "I would love to work with some people in Europe, I spaghetti!",
                  actor: true,
                  remote_photo_url: "https://asianmoviepulse.com/wp-content/uploads/2012/11/post/zhang-ziyi-woman-of-many-talents/z2.jpg"
                  )

leo = User.create(email: "leonardo@gmail.com",
                  password: "123456",
                  first_name: "Leonardo",
                  last_name: "Dicaprio",
                  username: "Leo6969",
                  gender: "Male",
                  age: 46,
                  location: "Los Angeles",
                  description: "I lost all my money on blow and Tarantino started some rude rumours about me. I'm willing to do anything!",
                  actor: true,
                  remote_photo_url: "https://timedotcom.files.wordpress.com/2014/10/455886166.jpg?w=600&quality=85"
                  )

andrea = User.create(email: "andrea@gmail.com",
                  password: "123456",
                  first_name: "Andrea",
                  last_name: "Bordeaux",
                  username: "DreaBaby",
                  gender: "Female",
                  age: 32,
                  location: "New York",
                  description: "Looking for my next opportunity!",
                  actor: true,
                  remote_photo_url: "http://pulsespikes.com/wp-content/uploads/2018/05/Andrea-Bordeaux-for-Pulse-Spikes-2.jpg"
                  )

deniro = User.create(email: "deniro@gmail.com",
                     password: "123456",
                     first_name: "Robert",
                     last_name: "De Niro",
                     username: "Robbydbag",
                     gender: "Male",
                     age: 46,
                     location: "Los Angeles",
                     description: "Spent all my money on a giant prostitution ring. Need money quick. hire me!!",
                     actor: true,
                     remote_photo_url: "https://www.tvtechnology.com/.image/t_share/MTU4NjgxMDQ1MTM3MzY4NjUw/robert-denirophotocredit-brigitte-lacombe.jpg"
                     )
con = User.create(email: "constantin@gmail.com",
                  password: "123456",
                  first_name: "Constantin",
                  last_name: "Eulenstein",
                  username: "BigC63",
                  gender: "Male",
                  age: 23,
                  location: "Los Angeles",
                  description: "Ich habe gerade gemerkt, dass ich beim Codieren nerve. Ich kann viel besser so tun, als wäre ich ein Hund.",
                  actor: true,
                  remote_photo_url: "https://avatars0.githubusercontent.com/u/55740765?v=4"
                  )
amir = User.create(email: "amir@gmail.com",
                  password: "123456",
                  first_name: "Amir",
                  last_name: "Khan",
                  username: "BuffKhanKhan",
                  gender: "Male",
                  age: 33,
                  location: "Mumbai",
                  description: "I love wrestling and hiking, want to make some extra money!",
                  actor: true,
                  remote_photo_url: "https://storage.googleapis.com/news-photo/95342-aamiragain.jpg"
                  )
Trademark.create(skill: "Doing drugs in front of your friends such that they think you are cool - you pay for drugs", price_per_hour: 400, user_id: leo.id)
Trademark.create(skill: "Bringing models to your party", price_per_hour: 1000, user_id: leo.id)
Trademark.create(skill: "Meeting parents", price_per_hour: 110, user_id: deniro.id)
Trademark.create(skill: "Pretending to be your friend", price_per_hour: 150, user_id: deniro.id)
Trademark.create(skill: "Drinking beer", price_per_hour: 1500, user_id: con.id)
Trademark.create(skill: "Bundesliga", price_per_hour: 2200, user_id: con.id)
Trademark.create(skill: "Doing flips", price_per_hour: 1500, user_id: andrea.id)
Trademark.create(skill: "Putting out fires", price_per_hour: 2200, user_id: andrea.id)
Trademark.create(skill: "Rubbing belly and tapping head at same time", price_per_hour: 1500, user_id: zhang.id)
Trademark.create(skill: "Interviewing illegal immigrants", price_per_hour: 2200, user_id: zhang.id)
Trademark.create(skill: "Fighting circus midgets", price_per_hour: 1500, user_id: amir.id)
Trademark.create(skill: "Driving school buses", price_per_hour: 2200, user_id: amir.id)



10.times do
  user = User.create(email: Faker::Internet.email,
                     password: "123456",
                     first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name,
                     username: Faker::Name.middle_name,
                     )
end



puts "created #{User.count} users"
puts "created #{Trademark.count} trademarks"
