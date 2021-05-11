# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

category1 = Category.create({:name=>"Men"})
category2 = Category.create({:name=>"Women"})
category3 = Category.create({:name=>"Kids"})
category4 = Category.create({:name=>"New Arrivals"})

puts "category1: #{category1.name}"
puts "category2: #{category2.name}"
puts "category3: #{category3.name}"
puts "category4: #{category4.name}"

Product.destroy_all

product1 = Product.create({:name=>"Roadster", :price => 20, :score=>5, :photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/10940528/2020/2/13/3e484090-d487-4252-9f30-beab10ce1f0a1581594832846-Roadster-Men-Tshirts-4501581594830605-1.jpg"})
product2 = Product.create({:name=>"Mast & Harbour", :price => 40, :score=>8, :photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/11607366/2020/7/7/0934b1f4-e34e-4201-a523-f21ae3a3987c1594121242660-Mast--Harbour-Men-Green-Solid-Polo-Collar-T-shirt-5641594121-1.jpg"})
product3 = Product.create({:name=>"Akatsuki Cosplay Hoodie", :price=>59.99, :score=>20, :photoURL=>"https://images-na.ssl-images-amazon.com/images/I/41cUihzGv-L._AC_SY780_.jpg"})
product4 = Product.create({:name=>"Black Polarised Sunglasses", :price=>32.45, :score=>8, :photoURL=>"https://i1.adis.ws/i/tom_ford/FT0711_01A_APPENDGRID?$listing_grid$"})

puts "Total number of products added: #{Product.all.count}"
puts "Product names: #{Product.all.pluck("name")}"
puts "Product1: #{product1.name} price: #{product1.price.round(2)}"
puts "Product2: #{product2.name} price: #{product2.price.round(2)}"
puts "Product3: #{product3.name} price: #{product3.price.round(2)}"
puts "Product4: #{product4.name} price: #{product4.price.round(2)}"


product1.categories << category1
product2.categories << category2
product3.categories << category1
product4.categories << category4



