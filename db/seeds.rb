# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
Reservation.destroy_all
Flat.destroy_all
User.destroy_all
puts 'creando usuarios'

user1 = User.new(name: 'lucas', email: 'lucas@gmail.com', password: '123456')
user1.save!
user2 = User.create(name: 'pedro', email: 'pedro@gmail.com', password: '1234dfd')
user3 = User.create(name: 'coco', email: 'coco@gmail.com', password: '123rytr')
puts user1.id

puts 'creando flats'
flat1 = Flat.create!(title: 'Crazy little house', price: 200, category: 'House', number_of_guests: '5', user_id: user1.id, location: '5869 Av. Patricio Peralta Ramos, Mar del Plata', description: 'The most unique house for you to enjoy with friends and family while getting to know this amazing city of lights, the best location ever.')
flat1.photo.attach(io: URI.open("https://images.unsplash.com/photo-1595525101922-d7febbdd796d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"), filename: "flat1.png", content_type: "image/jpeg")
flat1.save!

flat2 = Flat.create!(title: 'Aparment lux', price: 200, category: 'Apartment', number_of_guests: '2', user_id: user1.id, location: '2772 Rbla. Dr. Baltasar Brum, Montevideo', description: 'Your family will be close to everything when you stay at this centrally-located place. 10min Walk to the beach. 5min walk to Waterloo station from where you can go anywhere.')
flat2.photo.attach(io: URI.open("https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"), filename: "flat2.png", content_type: "image/jpeg")
flat2.save!

flat3 = Flat.create!(title: 'Moon boat', price: 800, category: 'Yatch', number_of_guests: '8', user_id: user2.id, location: '250 Uruguay, Mar del Plata', description: 'The best choice to enjoy your summer surranded by friends in the middle of the ocean but close to the funnest night city')
flat3.photo.attach(io: URI.open("https://images.unsplash.com/photo-1562281302-809108fd533c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"), filename: "flat3.png", content_type: "image/jpeg")
flat3.save!

flat4 = Flat.create!(title: 'Country house', price: 800, category: 'House', number_of_guests: '4', user_id: user2.id, location: 'Presidente Getúlio, Santa Catarina, Brazil', description: 'Relax in this unique and peaceful place. In Presidente Getúlio- Santa Catarina, enjoy on top of a hill, with breathtaking views, and practically in the city center (5 minutes), a place to be with those you like and enjoy a cozy atmosphere in Vale das Cachoeiras.')
flat4.photo.attach(io: URI.open("https://images.unsplash.com/photo-1562182384-08115de5ee97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"), filename: "flat4.png", content_type: "image/jpeg")
flat4.save!

flat5 = Flat.create!(title: 'Stunning Island in Blue Sea', price: 800, category: 'Island', number_of_guests: '8', user_id: user1.id, location: '23000, República Dominicana', description: 'Enjoy our exclusive private island located in the Rosario Islands. The place has a tropical style that combines with the beautiful landscape, perfect to disconnect from everyday life while surrounded by a sea of seven colors. The island has 4 rooms from which you can feel the smell of the sea, and a swimming pool to enjoy the paradisiacal place... Enjoy our Oasis.')
flat5.photo.attach(io: URI.open("https://images.unsplash.com/photo-1573548842355-73bb50e50323?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80"), filename: "flat5.png", content_type: "image/jpeg")
flat5.save!

flat6 = Flat.create!(title: 'Charming villa near San Pietro', price: 500, category: 'House', number_of_guests: '8', user_id: user1.id, location: 'Rome, Lazio, Italy', description: 'New building with concierge service 15 minutes walk from the Vatican museums and metro station A (Cyprus Vatican museums). Equipped with every comfort, with 50 Smart TV included with Netflix and Wi-Fi.Consisting of living room with kitchenette, double bedroom and large bathroom. Comfortable accommodation for tourism in central areas of Rome')
flat6.photo.attach(io: URI.open("https://images.unsplash.com/photo-1626260113600-84c917a39f59?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"), filename: "flat6.png", content_type: "image/jpeg")
flat6.save!

puts 'creando reservation'
Reservation.create(check_in: Date.yesterday, check_out: Date.today, user_id: user2.id, flat_id: flat1.id, number_of_guests: 3)
Reservation.create(check_in: Date.yesterday, check_out: Date.today, user_id: user3.id, flat_id: flat3.id, number_of_guests: 8)
Reservation.create(check_in: Date.yesterday, check_out: Date.today, user_id: user1.id, flat_id: flat2.id, number_of_guests: 2)
