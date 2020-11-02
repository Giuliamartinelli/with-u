# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email:"user1@gmail.com", password:"123456", name:"User1", phone_number:"3450847902")
User.create(email:"user2@gmail.com", password:"123456", name:"User2", phone_number:"3450847902")
Angel.create(name:"Angel1", user_id:1, phone_number:"3450847902")
Angel.create(name:"Angel2", user_id:1, phone_number:"3450847902")
Angel.create(name:"Angel3", user_id:1, phone_number:"3450847902")
Angel.create(name:"Angel4", user_id:2, phone_number:"3450847902")
Angel.create(name:"Angel5", user_id:2, phone_number:"3450847902")
Angel.create(name:"Angel6", user_id:2, phone_number:"3450847902")
