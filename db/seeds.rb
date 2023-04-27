# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


room = Room.new(address: "2345 N Lincoln Avenue", city: "Chicago", state: "IL", price: 1200, description: "Luxury High Rise", home_type: "Highrise", room_type: "Studio", total_occupancy: 3, total_bedrooms: 0, total_bathrooms: 1)

room.save