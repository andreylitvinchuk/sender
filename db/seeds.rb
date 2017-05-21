# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create_with(password: 'admin1').find_or_create_by(email: 'admin@example.com')

if Player.all.blank?
  10000.times do
    Player.create(
      name: "User #{rand(999)}",
      vk_id: "id#{rand(9999999)}",
      level: rand(30),
      paid: rand(10).even?
    )
  end
end