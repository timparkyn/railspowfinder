# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



station_list = [
  [ 'KCASQUAW9', 'Squaw Valley - Village Center' ],
  [ 'KCAOAKLA40', 'Oakland Hilltop' ],
  ['KCAKIRKW4',	'Kirkwood - Valley'],
  ['KCATRUCK151'	'Truckee - Skislope Way'],
  ['KCATRUCK149'	'Northstar - Martis Camp'],
  ['KNVGLENB14', 'Heavenly - Kingsbury Estates']
  ['KCASOUTH70', 'Heavenly - Montgomery Estates']
  ['KCATWINB4', 'Sierra at Tahoe']
]

station_list.each do |code, name|
  Station.create( code: code, description: name )
end


user_list = [
  [ 'psy', 'psy@dog.net', 'woofwoof', 'woofwoof']
  [ 'CyCy', 'CyCy@dog.net', 'woofwoof', 'woofwoof']
]

user_list.each do |name, email, password, password_confirmation|
  User.create(name: name, email: email, password: password, password_confirmation: password_confirmation)
end
