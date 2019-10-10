10.times do 
  User.create(name: Faker::Name.name)
  Restaurant.create(
    name: Faker::Restaurant.name,
    rating: rand(0..5), 
    address: Faker::Address.full_address
  )
end

number_rest = Restaurant.all.length
number_user = User.all.length

30.times do
  Restaurant.all[rand(0...number_rest)].users << User.all[rand(0...number_user)]
end