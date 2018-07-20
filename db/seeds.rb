# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

password = '123456'
names = ['Punnadit Trussat', 'Aifa Trussat', 'Onnicha Wattanasiributh']
emails = ['punnadittr@gmail.com', 'aifa@gmail.com', 'onnicha@gmail.com']

3.times do |i|
  User.create!(:name => names[i], 
              :email => emails[i], 
              :password => password, 
              :password_confirmation => password)
end



=begin
15.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  password = '123456'
  User.create!(:name => name, :email => email, :password => password, :password_confirmation => password)
end
=end