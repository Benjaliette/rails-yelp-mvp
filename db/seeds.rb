require 'faker'

puts "Delete the database instances"
Restaurant.destroy_all

puts "Created 5 restaurants"

10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
  restaurant.save
  5.times do
    Review.create(
      rating: [0, 1, 2, 3, 4, 5].sample,
      content: Faker::Restaurant.review,
      restaurant_id: restaurant.id
    )
  end
end
