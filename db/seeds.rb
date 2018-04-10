# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



station_list = [
  [ "KCASQUAW9", "Squaw Valley base" ],
  [ "KCAOAKLA40", "Oakland Hilltop" ]

]

station_list.each do |code, name|
  Station.create( code: code, name: name )
end


user_list = [
  [ 'psy', 'psy@dog.net', 'woofwoof', 'woofwoof']
  [ 'CyCy', 'CyCy@dog.net', 'woofwoof', 'woofwoof']
]

user_list.each do |name, email, password, password_confirmation|
  User.create(name: name, email: email, password: password, password_confirmation: password_confirmation)
end
