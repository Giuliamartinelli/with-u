# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email:"giulia@gmail.com", password:"123456", name:"Giulia Martinelli", phone_number:"+393450847902")
file_path = File.join(Rails.root, "/app/assets/images/user1.jpg")
user.photo.attach(io: File.open(file_path), filename: "user1.jpg")

User.create(email:"marco@gmail.com", password:"123456", name:"Marco Checchi", phone_number:"+4591485113")
User.create(email:"soraya@gmail.com", password:"123456", name:"Soraya De Lisa", phone_number:"+393479927877")
User.create(email:"naelle@gmail.com", password:"123456", name:"Naelle Burger", phone_number:"+4366488623868")
#user 1
Angel.create(name:"Angel Soraya", user_id:1, phone_number:"+393479927877")
Angel.create(name:"Angel Marco", user_id:1, phone_number:"+4591485113")
Angel.create(name:"Angel Naelle", user_id:1, phone_number:"+4366488623868")
# user 2
Angel.create(name:"Angel Soraya", user_id:2, phone_number:"+393479927877")
Angel.create(name:"Angel Giulia", user_id:2, phone_number:"+393450847902")
Angel.create(name:"Angel Naelle", user_id:2, phone_number:"+4366488623868")
# user 3
Angel.create(name:"Angel Giulia", user_id:3, phone_number:"+393450847902")
Angel.create(name:"Angel Marco", user_id:3, phone_number:"+4591485113")
Angel.create(name:"Angel Naelle", user_id:3, phone_number:"+4366488623868")
# user 4
Angel.create(name:"Angel Soraya", user_id:4, phone_number:"+393479927877")
Angel.create(name:"Angel Giulia", user_id:4, phone_number:"+393450847902")
Angel.create(name:"Angel Marco", user_id:4, phone_number:"+4591485113")
