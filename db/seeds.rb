# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## USERS

u1 = User.create!({
  first_name: 'Jonny',
  last_name: 'Walker',
  email: 'jonny@jungle.com',
  password: 'password',
  password_confirmation: 'password'
  })

u2 = User.create!({
  first_name: 'Billy',
  last_name: 'Cordova',
  email: 'billy@jungle.com',
  password: 'password',
  password_confirmation: 'password'
  })

u3 = User.create!({
  first_name: 'Andres',
  last_name: 'Rojas',
  email: 'andres@jungle.com',
  password: 'password',
  password_confirmation: 'password'
  })

u4 = User.create!({
  first_name: 'Camila',
  last_name: 'Carbajal',
  email: 'camila@jungle.com',
  password: 'password',
  password_confirmation: 'password'
  })


## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

p1 = cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

p2 = cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

p3 = cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

p4 = cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

p5 = cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

p6 = cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


p7 = cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

p8 = cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

p9 = cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

p10 = cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

p11 = cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

p12 = cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 0,
  price: 2_483.75
})

## REVIEWS

p1.reviews.create!({
  product_id: 1,
  user_id: 1,
  description: Faker::Hipster.paragraph(3),
  rating:3
  })

p1.reviews.create!({
  product_id: 1,
  user_id: 2,
  description: Faker::Hipster.paragraph(3),
  rating:4
  })

p2.reviews.create!({
  product_id: 2,
  user_id: 1,
  description: Faker::Hipster.paragraph(3),
  rating:3
  })

p2.reviews.create!({
  product_id: 2,
  user_id: 4,
  description: Faker::Hipster.paragraph(3),
  rating:3
  })

p3.reviews.create!({
  product_id: 3,
  user_id: 3,
  description: Faker::Hipster.paragraph(3),
  rating:3
  })

p3.reviews.create!({
  product_id: 3,
  user_id: 2,
  description: Faker::Hipster.paragraph(3),
  rating:4
  })

p4.reviews.create!({
  product_id: 4,
  user_id: 3,
  description: Faker::Hipster.paragraph(3),
  rating:5
  })

p4.reviews.create!({
  product_id: 4,
  user_id: 4,
  description: Faker::Hipster.paragraph(3),
  rating:1
  })

p5.reviews.create!({
  product_id: 5,
  user_id: 1,
  description: Faker::Hipster.paragraph(3),
  rating:1
  })

p6.reviews.create!({
  product_id: 6,
  user_id: 2,
  description: Faker::Hipster.paragraph(3),
  rating:2
  })

p7.reviews.create!({
  product_id: 7,
  user_id: 3,
  description: Faker::Hipster.paragraph(3),
  rating:3
  })

p8.reviews.create!({
  product_id: 8,
  user_id: 4,
  description: Faker::Hipster.paragraph(3),
  rating:1
  })

p9.reviews.create!({
  product_id: 9,
  user_id: 2,
  description: Faker::Hipster.paragraph(3),
  rating:4
  })

p10.reviews.create!({
  product_id: 10,
  user_id: 3,
  description: Faker::Hipster.paragraph(3),
  rating:5
  })

p11.reviews.create!({
  product_id:11,
  user_id: 3,
  description: Faker::Hipster.paragraph(3),
  rating:3
  })

p12.reviews.create!({
  product_id: 12,
  user_id: 2,
  description: Faker::Hipster.paragraph(3),
  rating:5
  })
puts "DONE!"
