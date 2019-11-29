# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trademark.destroy_all
User.destroy_all

User.create(email: "user@gmail.com",
            password: "123456",
            first_name: "Test",
            last_name: "User",
            username: "TestUser",
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
Trademark.create(skill: "Be a <smoot></smoot>h mf :)", user_id: leo.id)
Trademark.create(skill: "Versatile", user_id: leo.id)
Trademark.create(skill: "meeting parents", user_id: deniro.id)
Trademark.create(skill: "blowing bubbles", user_id: deniro.id)
Trademark.create(skill: "drinking beer", user_id: con.id)
Trademark.create(skill: "Bundasliga", user_id: con.id)



10.times do
  user = User.create(email: Faker::Internet.email,
              password: "123456",
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              username: Faker::Name.middle_name,
              )
end

20.times do |i|


  user = User.create!(email: Faker::Internet.email,
              password: "123456",
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              username: Faker::Internet.username,
              gender: Faker::Gender.binary_type,
              age: rand(18..80),
              location: Faker::Address.city,
              description: "I have appeared in over many film, television, and theatre productions. You may have seen them in many productions. Names ability to act has been recognized by the the board of actors with the actor award. I studied at a school. I can be reached at home.",
              actor: true)

  gender = user.gender == "Male" ? "men" : "women"
  url = "https://randomuser.me/api/portraits/#{gender}/#{i}.jpg"

  user.remote_photo_url = url
  user.save!

  2.times do
    Trademark.create(skill: ["Sewing","Tearing an apple in half with your hands","Dressing well", "Flipping eggs in a frying pan","Magic tricks", "Origami", "Juggling","Using chopsticks","Parallel Parking","Preparing a basic meal"].sample, user_id: user.id)
  end
end



puts "created #{User.count} users"
puts "created #{Trademark.count} trademarks"
