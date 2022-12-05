# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "seeding"

puts "🦸‍♀️ heros"
heros = []
10.times do
    heros << Hero.create(name: Faker::Name.name, super_name: Faker::Superhero.name )
end

puts "⚡ powers"
powers = []
5.times do
    powers << Power.create(name: Faker::Superhero.power, description: Faker::Lorem.paragraph_by_chars(number: rand(20..30), supplemental: false))
end

puts "🦸‍♀️ hero_powers ⚡"
10.times do
    HeroPower.create(strength: ["Strong", "Weak", "Average"].sample, hero_id: heros.sample.id, power_id: powers.sample.id)
end

puts "done seeding"





