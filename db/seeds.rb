# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'faker'

# PRODUCTS_COUNT = 100
#c = Cart.new(user_id: User.create(first_name: "Martin", last_name: "", email: "test@test.com", password: "password", password_confirmation: "password").id) 
#c.save!

user = User.create(first_name: "Martin",
                    last_name: "",
                    email: "test@test.com",
                    password: "password",
                    password_confirmation: "password",
                    avatar: Rails.root.join("app/assets/images/avatars/1.png").open,)
user.save!


Product.create!([{
  title: "Bohemia Sekt Demi Sec 0,75l",
  description: "Alk. 11% obj.",
  brand: "BOHEMIA SEKT, s.r.o",
  price: 150,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Bohemia_sekt_0,75l_540x540.jpg").open,
  user_id: user.id
  },
  {
  title: "Johnnie Walker Red label skotská whisky 0,7l",
  description: "Alk. 40 % obj.",
  brand: "Stock Plzeň-Božkov s.r.o",
  price: 300,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Johnnie_Walker_540x540.jpg").open,
  user_id: user.id
  },
  {
  title: "Stock Napoleon Ambassador 0,7l",
  description: "Alk. 28% obj.",
  brand: "Stock Plzeň-Božkov s.r.o",
  price: 174,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Napoleon_Ambassador_0.7l_540x540.jpg").open,
  user_id: user.id
  },
  {
  title: "Amundsen Premium vodka 0,5l",
  description: "Alk. 37.5 % vol.",
  brand: "Stock Plzeň-Božkov s.r.o",
  price: 130,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Amundsen_Premium_0.5l_540x540.jpg").open,
  user_id: user.id
  },
  {
  title: "2nd Bohemia Sekt Demi Sec 0,75l",
  description: "Alk. 11% obj.",
  brand: "BOHEMIA SEKT, s.r.o",
  price: 150,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Bohemia_sekt_0,75l_540x540.jpg").open,
  user_id: user.id
  },
  {
  title: "2nd Johnnie Walker Red label skotská whisky 0,7l",
  description: "Alk. 40 % obj.",
  brand: "Stock Plzeň-Božkov s.r.o",
  price: 300,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Johnnie_Walker_540x540.jpg").open,
  user_id: user.id
  },
  {
  title: "2nd Stock Napoleon Ambassador 0,7l",
  description: "Alk. 28% obj.",
  brand: "Stock Plzeň-Božkov s.r.o",
  price: 174,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Napoleon_Ambassador_0.7l_540x540.jpg").open,
  user_id: user.id
  },
  {
  title: "2nd Amundsen Premium vodka 0,5l",
  description: "Alk. 37.5 % vol.",
  brand: "Stock Plzeň-Božkov s.r.o",
  price: 130,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Amundsen_Premium_0.5l_540x540.jpg").open,
  user_id: user.id
  },
  {
  title: "2rd Bohemia Sekt Demi Sec 0,75l",
  description: "Alk. 11% obj.",
  brand: "BOHEMIA SEKT, s.r.o",
  price: 150,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Bohemia_sekt_0,75l_540x540.jpg").open,
  user_id: user.id
  },
  {
  title: "3rd Johnnie Walker Red label skotská whisky 0,7l",
  description: "Alk. 40 % obj.",
  brand: "Stock Plzeň-Božkov s.r.o",
  price: 300,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Johnnie_Walker_540x540.jpg").open,
  user_id: user.id
  },
  {
  title: "2rd Stock Napoleon Ambassador 0,7l",
  description: "Alk. 28% obj.",
  brand: "Stock Plzeň-Božkov s.r.o",
  price: 174,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Napoleon_Ambassador_0.7l_540x540.jpg").open,
  user_id: user.id
  },
  {
  title: "3rd Amundsen Premium vodka 0,5l",
  description: "Alk. 37.5 % vol.",
  brand: "Stock Plzeň-Božkov s.r.o",
  price: 130,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Amundsen_Premium_0.5l_540x540.jpg").open,
  user_id: user.id
  }
  ])



# MAX_CATEGORIES = 3
# MAX_VARIANTS = 4
# VARIANTS_WEIGHT = 0.53
# CATEGORIES = Faker::Base.fetch_all('commerce.department').map do |title|
#   Category.find_or_create_by!(title: title)
# end
# PRODUCTS_COUNT.times do
#   title = ''
#   # generate unique title
#   loop do
#     title = Faker::Commerce.product_name
#     break unless Product.exists?(title: title)
#   end
#   product = Product.new(
#     title: title,
#     price: Faker::Commerce.price
#   )
#   num_categories = 1 + rand(MAX_CATEGORIES)
#   product.categories = CATEGORIES.sample(num_categories)
#   if rand > VARIANTS_WEIGHT
#     num_variants = 1 + rand(MAX_VARIANTS)
#     num_variants.times do
#       product.variants.build(
#         title: rand > VARIANTS_WEIGHT ? Faker::Commerce.color : Faker::Commerce.material,
#         price: Faker::Commerce.price
#       )
#     end
#   end
#   product.save!
# end