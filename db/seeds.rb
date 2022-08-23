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
flat1 = Flat.create!(title: 'La Casita Loca', price: 200, category: 'House', number_of_guests: '5', user_id: user1.id, location: 'San Andres 455', description: 'La casa mas linda de Mar del Plata que podes disfrutar con amigos o familia')
flat1.photo.attach(io: URI.open("https://images.unsplash.com/photo-1595525101922-d7febbdd796d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"), filename: "flat1.png", content_type: "image/jpeg")
flat1.save!

flat2 = Flat.create!(title: 'Departamento lux', price: 200, category: 'Apartment', number_of_guests: '2', user_id: user1.id, location: 'Montevideo 40', description: 'Departamento perfecto si tenes que viajar y trabajar con una buena vista')
flat2.photo.attach(io: URI.open("https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"), filename: "flat2.png", content_type: "image/jpeg")
flat2.save!

flat3 = Flat.create!(title: 'El barco de Luna', price: 800, category: 'Yatch', number_of_guests: '8', user_id: user2.id, location: 'Uruguay 250, puerto de Mar del Plata', description: 'Este yatch es ideal para divertirse con amigos en verano')
flat3.photo.attach(io: URI.open("https://images.unsplash.com/photo-1562281302-809108fd533c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"), filename: "flat3.png", content_type: "image/jpeg")
flat3.save!

puts 'creando reservation'
Reservation.create(check_in: Date.yesterday, check_out: Date.today, user_id: user2.id, flat_id: flat1.id, number_of_guests: 3)
Reservation.create(check_in: Date.yesterday, check_out: Date.today, user_id: user3.id, flat_id: flat3.id, number_of_guests: 8)
Reservation.create(check_in: Date.yesterday, check_out: Date.today, user_id: user1.id, flat_id: flat2.id, number_of_guests: 2)
