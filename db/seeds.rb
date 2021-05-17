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

savedlist1 = Savedlist.create()
cart1 = Cart.create()
radUser = User.create({:name=>"RAD", :email=>"rad2021rmit@gmail.com", :password=>"Rails2021", :password_confirmation=>"Rails2021", :cart_id=>cart1.id, :savedlist_id=>savedlist1.id})

category1 = Category.create({:name=>"Men"})
category2 = Category.create({:name=>"Women"})
category3 = Category.create({:name=>"Kids"})
category4 = Category.create({:name=>"New Arrivals"})



product1 = Product.create({:name=>"Roadster", :price => 20, :score=>5})
ppicture1 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/10940528/2020/2/13/3e484090-d487-4252-9f30-beab10ce1f0a1581594832846-Roadster-Men-Tshirts-4501581594830605-1.jpg"})
ppicture5 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/10940528/2020/2/13/05a5a320-4ebd-4f69-8a49-5c88311131f41581594832731-Roadster-Men-Tshirts-4501581594830605-4.jpg"})
stock1 = Stock.create({:colour=>"blue", :size=>"L", :quantity=>10})
stock2 = Stock.create({:colour=>"pink", :size=>"L", :quantity=>5})
stock3 = Stock.create({:colour=>"blue", :size=>"M", :quantity=>15})
product1.categories << category1
product1.ppictures << ppicture1
product1.ppictures << ppicture5
product1.stocks << stock1
product1.stocks << stock2
product1.stocks << stock3



product2 = Product.create({:name=>"Mast & Harbour", :price => 40, :score=>8})
ppicture2 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/11607366/2020/7/7/0934b1f4-e34e-4201-a523-f21ae3a3987c1594121242660-Mast--Harbour-Men-Green-Solid-Polo-Collar-T-shirt-5641594121-1.jpg"})
stock4 = Stock.create({:colour=>"blue", :size=>"XL", :quantity=>2})
stock5 = Stock.create({:colour=>"black", :size=>"L", :quantity=>20})
stock6 = Stock.create({:colour=>"red", :size=>"S", :quantity=>15})
product2.categories << category1
product2.categories << category4
product2.ppictures << ppicture2
product2.stocks << stock4
product2.stocks << stock5
product2.stocks << stock6



product3 = Product.create({:name=>"Black Solid Tights", :price=>59.99, :score=>20})
ppicture3 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/2488706/2018/7/24/6c8fec5b-2d8f-49a7-b535-747ed9ab2c781532412089657-HRX-by-Hrithik-Roshan-Women-Tights-1591532412088349-1.jpg"})
ppicture4 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/2488706/2018/7/24/c8e14425-3fba-4a09-95d4-7f2e2e0964641532412089612-HRX-by-Hrithik-Roshan-Women-Tights-1591532412088349-3.jpg"})
ppicture5 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/2488706/2018/7/24/9d95ea01-6945-4159-951f-433f069095571532412089590-HRX-by-Hrithik-Roshan-Women-Tights-1591532412088349-4.jpg"})
ppicture6 = Ppicture.create({:photoURL=>"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/2488706/2018/7/24/f49e5dbd-d5ee-4d93-b7c0-80740938b5f61532412089571-HRX-by-Hrithik-Roshan-Women-Tights-1591532412088349-5.jpg"})
stock7 = Stock.create({:colour=>"black", :size=>"XL", :quantity=>200})
stock8 = Stock.create({:colour=>"black", :size=>"L", :quantity=>20})
stock9 = Stock.create({:colour=>"black", :size=>"S", :quantity=>0})
product3.categories << category2
product3.categories << category4
product3.ppictures << ppicture3
product3.ppictures << ppicture4
product3.ppictures << ppicture5
product3.ppictures << ppicture6
product3.stocks << stock7
product3.stocks << stock8
product3.stocks << stock9



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
