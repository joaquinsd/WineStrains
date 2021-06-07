# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Strain.destroy_all
Oenologist.destroy_all
Magazine.destroy_all


# Strain.create(name: "Cabernet Sauvignon")
# Strain.create(name: "Merlot")
# Strain.create(name: "Malbec")
# Strain.create(name: "Carmenere")
# Strain.create(name: "Syrah")
# Strain.create(name: "Pinot Noir")

# Position.create(name: 'Reviewer')
# Position.create(name: 'Writer')
# Position.create(name: 'Editor')
 15.times do
  magazine = Faker::Book.unique.publisher
  Magazine.create(name: magazine)
 end


10.times do
  name = Faker::TvShows::TwinPeaks.character
  nationality = Faker::Nation.nationality
  age = rand(30..80)
  mag = Magazine.find(rand(Magazine.first.id..Magazine.last.id))
  pos = Position.find(rand(Position.first.id..Position.last.id))
  Oenologist.create(name: name, age: age, nationality: nationality, oenologist_magazine_positions_attributes: [magazine_id: mag.id, position_id: pos.id] )
end
