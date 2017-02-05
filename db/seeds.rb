10.times do
  User.create!(email: Faker::Internet.email,
               username: Faker::Internet.user_name,
               password: "password")
end

restaurant_seeds = [
  { name: Faker::Lorem.sentence, city: Faker::Address.city, state: Faker::Address.state, creator_id: 1, cuisine: "french", address: Faker::Address.street_address},
  { name: Faker::Lorem.sentence, city: Faker::Address.city, state: Faker::Address.state, creator_id: 1, cuisine: "mexican", address: Faker::Address.street_address },
  { name: Faker::Lorem.sentence, city: Faker::Address.city, state: Faker::Address.state, creator_id: 3, cuisine: "healthy", address: Faker::Address.street_address  },
  { name: Faker::Lorem.sentence, city: Faker::Address.city, state: Faker::Address.state, creator_id: 3, cuisine: "american new", address: Faker::Address.street_address  },
  { name: Faker::Lorem.sentence, city: Faker::Address.city, state: Faker::Address.state, creator_id: 4, cuisine: "thai", address: Faker::Address.street_address }

]

restaurant_seeds.each { |restaurant| Restaurant.create!(restaurant)}

review_seeds = [
  { content: "omg, so yummy!", points: 5, author_id: 1, restaurant_id: 1 },
  { content: "terrible service. avoid.", points: 1, author_id: 2, restaurant_id: 2 },
  { content: "this place is ok. I've had better", points: 3, author_id: 4, restaurant_id: 1 },
  { content: "i've never eaten here but heard it's good", points: 4, author_id: 8, restaurant_id: 3 },
  { content: "not worth the price!!!", points: 2, author_id: 9, restaurant_id: 4 },
  { content: "their happy hour specials are great", points: 3, author_id: 7, restaurant_id: 5 },
]

review_seeds.each { |review| Review.create!(review) }
