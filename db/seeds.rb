# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Product.destroy_all
Ppicture.destroy_all
Stock.destroy_all
Savedlist.destroy_all
Cart.destroy_all
User.destroy_all
ProductTag.destroy_all

savedlist1 = Savedlist.create()
cart1 = Cart.create()

adminUser = User.create!({:name=>"RADAdmin", :email=>"admin@admin.com", :password=>"Rails2021", :password_confirmation=>"Rails2021", :cart_id=>cart1.id, :savedlist_id=>savedlist1.id, :admin => true})

savedlist2 = Savedlist.create()
cart2 = Cart.create()

radUser = User.create({:name=>"RAD", :email=>"rad2021rmit@gmail.com", :password=>"Rails2021", :password_confirmation=>"Rails2021", :cart_id=>cart2.id, :savedlist_id=>savedlist2.id})

category1 = Category.create({:name=>"Men"})
category2 = Category.create({:name=>"Women"})
category3 = Category.create({:name=>"Kids"})
category4 = Category.create({:name=>"New Arrivals"})

product_tag1 = ProductTag.create({:tag=>"Outdoor"})
product_tag2 = ProductTag.create({:tag=>"T-shirt"})
product_tag3 = ProductTag.create({:tag=>"Workout"})
product_tag4 = ProductTag.create({:tag=>"Formal"})
product_tag5 = ProductTag.create({:tag=>"Casual"})
product_tag6 = ProductTag.create({:tag=>"Jeans"})
product_tag7 = ProductTag.create({:tag=>"Footwear"})

product1 = Product.create({:name=>"Roadster", :price => 20, :score=>5})
ppicture1 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/10940528/2020/2/13/3e484090-d487-4252-9f30-beab10ce1f0a1581594832846-Roadster-Men-Tshirts-4501581594830605-1.jpg"})
ppicture5 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/10940528/2020/2/13/05a5a320-4ebd-4f69-8a49-5c88311131f41581594832731-Roadster-Men-Tshirts-4501581594830605-4.jpg"})
stock1 = Stock.create({:colour=>"Blue", :size=>"L", :quantity=>10})
stock2 = Stock.create({:colour=>"Pink", :size=>"L", :quantity=>5})
stock3 = Stock.create({:colour=>"Blue", :size=>"M", :quantity=>15})
product1.categories << category1
product1.ppictures << ppicture1
product1.ppictures << ppicture5
product1.stocks << stock1
product1.stocks << stock2
product1.stocks << stock3
product1.product_tags << product_tag1
product1.product_tags << product_tag2
product1.product_tags << product_tag5

product2 = Product.create({:name=>"Mast & Harbour", :price => 40, :score=>8})
ppicture2 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/11607366/2020/7/7/0934b1f4-e34e-4201-a523-f21ae3a3987c1594121242660-Mast--Harbour-Men-Green-Solid-Polo-Collar-T-shirt-5641594121-1.jpg"})
stock4 = Stock.create({:colour=>"Blue", :size=>"XL", :quantity=>2})
stock5 = Stock.create({:colour=>"Black", :size=>"L", :quantity=>20})
stock6 = Stock.create({:colour=>"Red", :size=>"S", :quantity=>15})
product2.categories << category1
product2.categories << category4
product2.ppictures << ppicture2
product2.stocks << stock4
product2.stocks << stock5
product2.stocks << stock6
product2.product_tags << product_tag1
product2.product_tags << product_tag2
product2.product_tags << product_tag4

product3 = Product.create({:name=>"Black Solid Tights", :price=>59.99, :score=>20})
ppicture3 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/2488706/2018/7/24/6c8fec5b-2d8f-49a7-b535-747ed9ab2c781532412089657-HRX-by-Hrithik-Roshan-Women-Tights-1591532412088349-1.jpg"})
ppicture4 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/2488706/2018/7/24/c8e14425-3fba-4a09-95d4-7f2e2e0964641532412089612-HRX-by-Hrithik-Roshan-Women-Tights-1591532412088349-3.jpg"})
ppicture5 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/2488706/2018/7/24/9d95ea01-6945-4159-951f-433f069095571532412089590-HRX-by-Hrithik-Roshan-Women-Tights-1591532412088349-4.jpg"})
ppicture6 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/2488706/2018/7/24/f49e5dbd-d5ee-4d93-b7c0-80740938b5f61532412089571-HRX-by-Hrithik-Roshan-Women-Tights-1591532412088349-5.jpg"})
stock7 = Stock.create({:colour=>"Black", :size=>"XL", :quantity=>200})
stock8 = Stock.create({:colour=>"Black", :size=>"L", :quantity=>20})
stock9 = Stock.create({:colour=>"Black", :size=>"S", :quantity=>0})
product3.categories << category2
product3.categories << category4
product3.ppictures << ppicture3
product3.ppictures << ppicture4
product3.ppictures << ppicture5
product3.ppictures << ppicture6
product3.stocks << stock7
product3.stocks << stock8
product3.stocks << stock9
product3.product_tags << product_tag1
product3.product_tags << product_tag3

product4 = Product.create({:name=>"Boys Round Neck T-shirt", :price=>32.45, :score=>8})
ppicture7 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2021/4/12/3b899834-ee06-4fb3-923a-98c79d43ed8d1618199917020-1.jpg"})
ppicture8 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2021/4/12/3c3e3e71-ee97-4fc4-828f-562daa1c099a1618199917039-2.jpg"})
ppicture9 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2021/4/12/1eae8e2f-6072-47f5-951c-caa5472aa7fd1618199917060-3.jpg"})
stock10 = Stock.create({:colour=>"Yellow", :size=>"XXL", :quantity=>10})
stock11 = Stock.create({:colour=>"Yellow", :size=>"XL", :quantity=>50})
stock12 = Stock.create({:colour=>"Yellow", :size=>"L", :quantity=>75})
stock13 = Stock.create({:colour=>"Yellow", :size=>"M", :quantity=>34})
stock14 = Stock.create({:colour=>"Yellow", :size=>"S", :quantity=>56})
stock15 = Stock.create({:colour=>"Yellow", :size=>"XS", :quantity=>12})
product4.categories << category3
product4.ppictures << ppicture7
product4.ppictures << ppicture8
product4.ppictures << ppicture9
product4.stocks << stock10
product4.stocks << stock11
product4.stocks << stock12
product4.stocks << stock13
product4.stocks << stock14
product4.stocks << stock15
product4.product_tags << product_tag1
product4.product_tags << product_tag2
product4.product_tags << product_tag3
product4.product_tags << product_tag4
product4.product_tags << product_tag5
product4.product_tags << product_tag6


product5 = Product.create({:name=>"LocoMotive Sneakers", :price=>69.99, :score=>24})
ppicture10 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/9785495/2019/6/14/906f1f81-db79-481b-9962-6306abe4a1bf1560500752934-LOCOMOTIVE-Men-Grey-Sneakers-5091560500751016-1.jpg"})
ppicture11 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/9785495/2021/2/1/d05dfcd9-551c-4298-96b1-f559638e362c1612186470220-LOCOMOTIVE-Men-Grey-Sneakers-3871612186469011-2.jpg"})
ppicture12 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/9785495/2021/2/1/fe468f31-65ba-4885-a63c-7b02f21101801612186470199-LOCOMOTIVE-Men-Grey-Sneakers-3871612186469011-3.jpg"})
ppicture13 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/9785495/2021/2/1/d40a08bf-6536-4c07-ba36-4f0882d883ff1612186470147-LOCOMOTIVE-Men-Grey-Sneakers-3871612186469011-5.jpg"})
stock16 = Stock.create({:colour=>"Grey", :size=>"L", :quantity=>100})
stock17 = Stock.create({:colour=>"Grey", :size=>"M", :quantity=>100})
stock18 = Stock.create({:colour=>"Grey", :size=>"S", :quantity=>100})
stock19 = Stock.create({:colour=>"White", :size=>"L", :quantity=>100})
stock20 = Stock.create({:colour=>"White", :size=>"M", :quantity=>100})
stock21 = Stock.create({:colour=>"White", :size=>"S", :quantity=>100})
product5.categories << category1
product5.categories << category2
product5.ppictures << ppicture10
product5.ppictures << ppicture11
product5.ppictures << ppicture12
product5.ppictures << ppicture13
product5.stocks << stock16
product5.stocks << stock17
product5.stocks << stock18
product5.stocks << stock19
product5.stocks << stock20
product5.stocks << stock21
product5.product_tags << product_tag1
product5.product_tags << product_tag5
product5.product_tags << product_tag7

product6 = Product.create({:name=>"Solid Thermal Jacket", :price=>87.56, :score=>14})
ppicture14 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2021/3/24/6cdb5ba8-b9cf-482d-add8-cdcc5d127e5f1616577985048-1.jpg"})
ppicture15 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2021/3/24/80e1c223-9695-4479-98e0-854b9206ff231616577985075-2.jpg"})
ppicture16 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2021/3/24/445fd908-0ed8-41ba-85df-1f1743abd82f1616577985095-3.jpg"})
ppicture17 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2021/3/24/89229402-f0e6-43e0-8698-6c24535000af1616577985114-5.jpg"})
stock22 = Stock.create({:colour=>"Blue", :size=>"L", :quantity=>13})
stock23 = Stock.create({:colour=>"Blue", :size=>"M", :quantity=>5})
stock24 = Stock.create({:colour=>"Blue", :size=>"S", :quantity=>21})
product6.categories << category3
product6.categories << category4
product6.ppictures << ppicture14
product6.ppictures << ppicture15
product6.ppictures << ppicture16
product6.ppictures << ppicture17
product6.stocks << stock22
product6.stocks << stock23
product6.stocks << stock24
product6.product_tags << product_tag3
product6.product_tags << product_tag5

# puts "Total number of products added: #{Product.all.count}"
# puts "Product names: #{Product.all.pluck("name")}"
# puts "Product1: #{product1.name} price: #{product1.price.round(2)}"
# puts "Product2: #{product2.name} price: #{product2.price.round(2)}"
# puts "Product3: #{product3.name} price: #{product3.price.round(2)}"
# puts "Product4: #{product4.name} price: #{product4.price.round(2)}"

# ppicture8 = Ppicture.create({:photoURL=>"https://i1.adis.ws/i/tom_ford/FT0711_01A_APPENDGRID?$listing_grid$"})

# puts "Added ppictures"

# product3.ppictures << ppicture7
# product4.ppictures << ppicture8

# product3.categories << category1
# product4.categories << category4

# puts "category1: #{category1.name}"
# puts "category2: #{category2.name}"
# puts "category3: #{category3.name}"
# puts "category4: #{category4.name}"

# puts "Stock1: colour: #{stock1.colour} size: #{stock1.colour} quantity: #{stock1.quantity}"
# puts "Stock2: colour: #{stock2.colour} size: #{stock2.colour} quantity: #{stock2.quantity}"
# puts "Stock3: colour: #{stock3.colour} size: #{stock3.colour} quantity: #{stock3.quantity}"

puts "-----------------------------------------------------------------------------------------------------"