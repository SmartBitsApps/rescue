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

user = User.create(first_name: "Martin", last_name: "", email: "test@test.com", password: "password", password_confirmation: "password")
user.save!


Product.create!([{
  title: "Bohemia Sekt Demi Sec 0,75l",
  description: "Alk. 11% obj.",
  brand: "BOHEMIA SEKT, s.r.o",
  price: 150,
  quantity: 100,
  image: Rails.root.join("app/assets/images/products/Bohemia_sekt_0,75l_540x540.jpg").open,
  user_id: user.id
}])



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