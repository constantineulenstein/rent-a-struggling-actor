# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Trademark.destroy_all

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
Trademark.create(skill: "Be a smooth mf :)", user_id: leo.id)
Trademark.create(skill: "Versatile", user_id: leo.id)


10.times do
  user = User.create(email: Faker::Internet.email,
              password: "123456",
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              username: Faker::Name.middle_name,
              )
end


20.times do
  user = User.create(email: Faker::Internet.email,
              password: "123456",
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              username: Faker::Name.middle_name,
              gender: Faker::Gender.binary_type,
              age: rand(18..80),
              location: Faker::Address.city,
              description: Faker::Verb.base,
              actor: true,
              remote_photo_url: "https://picsum.photos/200",
              )


  2.times do
    Trademark.create(skill: Faker::Games::ElderScrolls.creature, user_id: user.id)
  end
end



puts "created #{User.count} users"
puts "created #{Trademark.count} trademarks"
