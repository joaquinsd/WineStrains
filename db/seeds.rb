# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Strain.destroy_all

Strain.create(name: "Cabernet Sauvignon")
Strain.create(name: "Merlot")
Strain.create(name: "Malbec")
Strain.create(name: "Carmenere")
Strain.create(name: "Syrah")
Strain.create(name: "Pinot Noir")
