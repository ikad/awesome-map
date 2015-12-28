# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Marker.delete_all
Message.delete_all
User.create(nickname: 'Guest', email: 'guest@guest.com', password: '11111111', password_confirmation: '11111111')