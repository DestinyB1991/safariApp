 Photo.destroy_all
 User.destroy_all
 Animal.destroy_all


# josh = User.create(name: "Josh") 
# david = User.create(name: "David") 
# brittany = User.create(name: "Brittany") 

# Savana
lion = Animal.create(name: "Lion", emoji: "🦁")
gorilla = Animal.create(name: "Gorilla", emoji:"🦍")
leopard = Animal.create(name: "Leopard", emoji: "🐆")

# Grass lands
zebra = Animal.create(name: "Zebra", emoji: "🦓")
gazel = Animal.create(name: "Gazel", emoji: "🐴")
giraf = Animal.create(name: "Giraf", emoji: "🦒")

# Swamp
hippo = Animal.create(name: "Hippo", emoji: "🦛")
rhino = Animal.create(name: "Rhino", emoji: "🦏")
elephant = Animal.create(name: "Elephant", emoji: "🐘")

# photo1 = Photo.create(user: josh, animal: lion)
# photo2 = Photo.create(user: josh, animal: zebra)
# photo3 = Photo.create(user: brittany, animal: hippo)

binding.pry
puts "Seeded"