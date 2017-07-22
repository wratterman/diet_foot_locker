# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Brand.destroy_all
Sport.destroy_all
Review.destroy_all
Sneaker.destroy_all

a = Brand.create(name: "Nike",
             image_url: 'http://logok.org/wp-content/uploads/2014/03/Nike-logo-+-wordmark.png')
b = Brand.create(name: "Jordan",
             image_url: 'https://i.ytimg.com/vi/IvsFTn3PK10/maxresdefault.jpg')
c = Brand.create(name: "Adidas",
             image_url: 'http://www.thelogofactory.com/wp-content/uploads/2015/09/adidas-trefoil-logo.png')
d = Brand.create(name: "Under Armour",
             image_url: 'http://www.findthatlogo.com/wp-content/uploads/2011/11/under-armour-inc-logo.gif')

e = Sport.create(name: "Basketball",
             image_url: 'https://images-na.ssl-images-amazon.com/images/I/71ur2SOvu7L._SY355_.jpg')
f = Sport.create(name: "Casual",
             image_url: 'http://casualwearbcn.com/wp-content/uploads/2015/06/Logo-casualwear.png')


Sneaker.create(name: 'Nike Air Force One', description: 'The Original all White Nike',
               image_url: 'http://images.finishline.com/is/image/FinishLine/315115_112?$Main$', price: 89.99,
               footlocker_url: 'https://www.footlocker.com/product/model:98963/sku:24300657/nike-air-force-1-low-mens/all-white/white/',
               brand_id: a.id, sport_id: f.id)
Sneaker.create(name: 'Nike LeBron Soldier 11', description: 'The King is in with the newest release of his Soldier line.',
               image_url: 'http://images.finishline.com/is/image/FinishLine/918369_002?$Main$', price: 129.99,
               footlocker_url: 'https://www.footlocker.com/product/model:281065/sku:97644002/nike-lebron-soldier-11-mens/lebron-james/black/white/',
               brand_id: a.id, sport_id: e.id)
Sneaker.create(name: 'Nike KD X', description: 'New Champ? Check. Finals MVP? Chech. Dope Kicks? Check.',
               image_url: 'https://i1.wp.com/www.nicekicks.com/files/2017/06/nike-kd-10-oreo.jpg?resize=712%2C500', price: 149.99,
               footlocker_url: 'https://www.footlocker.com/product/model:280622/sku:97815001/nike-kd-x-mens/kevin-durant/black/white/',
               brand_id: a.id, sport_id: e.id)
Sneaker.create(name: 'Jordan Retro 4', description: 'Jordan Retro - 4th Edition',
               image_url: 'https://sneakerbardetroit.com/wp-content/uploads/2016/02/nike-air-jordan-4-cement-retro-2016-5.jpg', price: 189.99,
               footlocker_url: 'https://www.footlocker.com/product/model:173251/sku:08497006/jordan-retro-4-mens/black/blue/',
               brand_id: b.id, sport_id: e.id)
Sneaker.create(name: 'Jordan Jumpman Pro', description: 'Anything more Iconic than THE Jumpman selling his Jumpman shoes? A question for the philosophers, these make me want to ball',
               image_url: 'http://images.finishline.com/is/image/FinishLine/906876_001?$Main$', price: 109.99,
               footlocker_url: 'https://www.footlocker.com/product/model:273883/sku:06876001/jordan-jumpman-pro-mens/black/red/',
               brand_id: b.id, sport_id: e.id)
Sneaker.create(name: 'Jordan 6 Rings', description: 'Count Em!',
               image_url: 'https://cdn.shopify.com/s/files/1/1024/4541/products/JORDAN_6_RINGS_1_large.jpg?v=1497269614', price: 129.99,
               footlocker_url: 'https://www.footlocker.com/product/model:95402/sku:22992400/jordan-6-rings-mens/blue/white/',
               brand_id: b.id, sport_id: e.id)
Sneaker.create(name: 'Adidas Original Top Ten Hi', description: 'Fresh Shoe Game? These are for you',
               image_url: 'https://sneakerbardetroit.com/wp-content/uploads/2014/11/adidas-originals-top-ten-hi-snake-lux-pack-1.jpg', price: 88.99,
               footlocker_url: 'https://www.footlocker.com/product/model:209385/sku:69546/adidas-originals-top-ten-hi-mens/grey/black/',
               brand_id: c.id, sport_id: f.id)
Sneaker.create(name: 'Adidas Tubular X', description: 'Unisex shoe specifically designed for slaying',
               image_url: 'https://cdn5.kicksonfire.com/wp-content/uploads/2016/02/adidas-Originals-Tubular-X-6.jpg?x77385', price: 159.99,
               footlocker_url: 'https://www.footlocker.com/product/model:263591/sku:S80131/adidas-originals-tubular-x-primeknit-mens/navy/navy/',
               brand_id: c.id, sport_id: e.id)
Sneaker.create(name: 'Adidas NMD R2', description: 'The Comfiest Shoe Ever per Jimmy. So you know it is true.',
               image_url: 'https://thesolesupplier.co.uk/wp-content/uploads/2017/03/adidas-NMD-R2-Black-Red-03.png', price: 169.99,
               footlocker_url: 'https://www.footlocker.com/product/model:278220/sku:BY9409/adidas-originals-nmd-r2-primeknit-mens/black/grey/',
               brand_id: c.id, sport_id: f.id)
  Sneaker.create(name: 'Under Armour Curry 3', description: 'Well...at least he is a good player.',
               image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2vm9SfSzDNZsaVCUEbRy81ZR3EAsl6P_yVn5KlPB6GcJUxKxBnQ', price: 99.99,
               footlocker_url: 'https://www.footlocker.com/product/model:269873/sku:69279006/under-armour-curry-3-mens/stephen-curry/black/white/',
               brand_id: d.id, sport_id: e.id)

puts "Database seeded with #{Brand.count} brands, #{Sport.count} sports, and #{Sneaker.count} Sneakers!"
