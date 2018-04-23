# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



station_list = [
  [ "KCASQUAW9", "Squaw Valley base" ],
  [ "KCAOAKLA40", "Oakland Hilltop" ],
  [ "KCASODA49", "SugarBowl - Serene Lakes"],
  [ "KCATRUCK149", "Northstar - Martis Camp"],
  [ "KNVRENO352", "Mt. Rose - Tannenbaum"],
  [ "KNVGLENB14", "Heavenly - Kingsbury Estates"],
  [ "KCASOUTH70", "Heavenly - Montgomery Estates"],
  [ "KCATWINB4", "Sierra At Tahoe"],
  [ "KCAKIRKW4", "Kirkwood Valley"]

]

station_list.each do |code, desc|
  Station.create( code: code, description: desc )
end


user_list = [
  [ 'psy', 'psy@dog.net', 'woofwoof', 'woofwoof'],
  [ 'CyCy', 'CyCy@dog.net', 'woofwoof', 'woofwoof']
]

user_list.each do |name, email, password, password_confirmation|
  User.create(name: name, email: email, password: password, password_confirmation: password_confirmation)
end
