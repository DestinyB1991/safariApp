 Photo.destroy_all
 User.destroy_all
 Animal.destroy_all


josh = User.create(name: "Josh") 
david = User.create(name: "David") 
brittany = User.create(name: "Brittany") 

lion = Animal.create(name: "Lion")
zebra = Animal.create(name: "Zebra")
hippo = Animal.create(name: "Hippo")

photo1 = Photo.create(user: josh, animal: lion)
photo2 = Photo.create(user: josh, animal: zebra)
photo3 = Photo.create(user: brittany, animal: hippo)

binding.pry

puts "Seeded"