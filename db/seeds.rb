# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Trademark.destroy_all

User.create(email: "leonardo@gmail.com",
            password: "123456",
            first_name: "Leonardo",
            last_name: "Dicaprio",
            username: "Leonardo69",
)



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
              actor: true
              )


  2.times do
    Trademark.create(skill: Faker::Games::ElderScrolls.creature, user_id: user.id)
  end
end



puts "created #{User.count} users"
puts "created #{Trademark.count} trademarks"
