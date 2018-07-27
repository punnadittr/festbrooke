# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create!(:name => 'Punnadit Trussat', :email => 'punnadittr@gmail.com', :password => '123456', :password_confirmation => '123456')
User.create!(:name => 'Aifa Trussat', :email => 'aifa@gmail.com', :password => '123456', :password_confirmation => '123456')
User.create!(:name => 'Onnicha Wattanasiributh', :email => 'onnicha@gmail.com', :password => '123456', :password_confirmation => '123456')

99.times do
  name = Faker::Name.first_name + ' ' + Faker::Name.last_name
  email = Faker::Internet.email
  password = '123456'
  User.create!(:name => name, :email => email, :password => password, :password_confirmation => password)
end