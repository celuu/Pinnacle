# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)





require "open-uri"


  puts "Destroying tables..."
  # Unnecessary if using `rails db:seed:replant`
  Club.destroy_all
  Reservation.destroy_all
  Review.destroy_all
  Group.destroy_all
  User.destroy_all
  
  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!('users')
  ActiveRecord::Base.connection.reset_pk_sequence!(:groups)
  ActiveRecord::Base.connection.reset_pk_sequence!(:reviews)
  ActiveRecord::Base.connection.reset_pk_sequence!(:reservations)
  ActiveRecord::Base.connection.reset_pk_sequence!(:clubs)

  puts "Creating users..."
  # Create one user with an easy to remember username, email, and password:
  User.create!(
    username: 'Demo-lition', 
    fname: "Demo",
    lname: "User",
    email: 'demo@user.io', 
    password: 'password'
  )

  User.create!(
    username: 'cluu', 
    fname: "christine",
    lname: "luu",
    email: 'christine@gmail.com', 
    password: 'password',
    admin: 'true'
  )

  User.create!(
    username: 'admin', 
    fname: "admin",
    lname: "user",
    email: 'admin@gmail.com', 
    password: 'password',
    admin: 'true'
  )

  User.create!(
    username: 'nishant', 
    fname: "nishant",
    lname: "racherla",
    email: 'nishant@gmail.com', 
    password: 'password',
    admin: 'true'
  )

  # More users
  10.times do 
    User.create!({
      username: Faker::Internet.unique.username(specifier: 3),
      email: Faker::Internet.unique.email,
      fname: Faker::Internet.unique.username,
      lname: Faker::Internet.unique.username,
      password: 'password'
    }) 
  end

  club1 = Club.create!({
    location: "Equinox Sports Club San Francisco",
    longitude: -122.40433471519589,
    latitude: 37.786742643317524,
    address: "747 Market Street San Francisco, CA 94103",
    phone_num: "(415)633-3900"
  })

  club2 = Club.create!({
    location: "Equinox Pine Street",
    longitude: -122.40129723054208,
    latitude: 37.792043503834854,
    address: "301 Pine Street San Francisco, CA 94104",
    phone_num: "(415)593-4000"

  })

  club3 = Club.create!({
    location: "Equinox Union Street",
    longitude: -122.43309830170536,
    latitude: 37.79727467952462,
    address: "2055 Union Street San Francisco, CA 94123",
    phone_num: "(415)854-0799"
  })

  club4 = Club.create!({
    location: "Equinox Beale Street",
    longitude: -122.39632967286896,
    latitude: 37.79122846283731,
    address: "320 Mission Street San Francisco, CA 94105",
    phone_num: "(415)228-0024"
  })

  club5 = Club.create!({
    location: "Equinox Van Mission",
    longitude: -122.41846463054247,
    latitude: 37.773657089271786,
    address: "1560 Mission Street San Francisco, CA 94103",
    phone_num: "(415)228-5259"
  })




  puts "Creating groups"

class30 = Group.create!(name: "Boxing" ,day_of_week: "Sunday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club1.id)
class72 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Sunday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club2.id)
class99 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Sunday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club3.id)
class131 = Group.create!(name: "Lower Body Blast" ,day_of_week: "Sunday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,club_id: club4.id)
class183 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Sunday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club5.id)
class28 = Group.create!(name: "Barre" ,day_of_week: "Sunday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club1.id)
class70 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Sunday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club2.id)
class97 = Group.create!(name: "Athletic Conditioning" ,day_of_week: "Sunday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club3.id)
class181 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Sunday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club5.id)
class129 = Group.create!(name: "TRX Max" ,day_of_week: "Sunday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club4.id)
class29 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Sunday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club1.id)
class71 = Group.create!(name: "TRX Max" ,day_of_week: "Sunday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club2.id)
class95 = Group.create!(name: "Boxing" ,day_of_week: "Sunday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club3.id)
class98 = Group.create!(name: "Boxing" ,day_of_week: "Sunday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club3.id)
class132 = Group.create!(name: "Boxing" ,day_of_week: "Sunday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club4.id)
class182 = Group.create!(name: "TRX Max" ,day_of_week: "Sunday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club5.id)
class130 = Group.create!(name: "True Barre" ,day_of_week: "Sunday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club4.id)
class31 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Sunday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club1.id)
class73 = Group.create!(name: "Precision Run" ,day_of_week: "Sunday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club2.id)
class184 = Group.create!(name: "Precision Run" ,day_of_week: "Sunday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club5.id)
class32 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Sunday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club1.id)
class74 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Sunday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club2.id)
class96 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Sunday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club3.id)
class106 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Sunday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club3.id)
class133 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Sunday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club4.id)
class180 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Sunday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club5.id)
class185 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Sunday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club5.id)
class35 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Monday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club1.id)
class38 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Monday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,club_id: club2.id)
class104 = Group.create!(name: "Boxing" ,day_of_week: "Monday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club3.id)
class146 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Monday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club4.id)
class149 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Monday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,club_id: club5.id)
class33 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Monday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club1.id)
class39 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Monday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club2.id)
class102 = Group.create!(name: "Barre" ,day_of_week: "Monday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club3.id)
class144 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Monday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club4.id)
class150 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Monday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club5.id)
class40 = Group.create!(name: "TRX Max" ,day_of_week: "Monday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club2.id)
class151 = Group.create!(name: "TRX Max" ,day_of_week: "Monday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club5.id)
class41 = Group.create!(name: "Slow Flow Yoga" ,day_of_week: "Monday" ,time: "04:00 pm - 05:00 pm" ,instructor_name: "Gustavo Rearte" ,club_id: club2.id)
class152 = Group.create!(name: "Slow Flow Yoga" ,day_of_week: "Monday" ,time: "04:00 pm - 05:00 pm" ,instructor_name: "Gustavo Rearte" ,club_id: club5.id)
class34 = Group.create!(name: "TRX Max" ,day_of_week: "Monday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club1.id)
class103 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Monday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club3.id)
class145 = Group.create!(name: "TRX Max" ,day_of_week: "Monday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club4.id)
class42 = Group.create!(name: "True Barre" ,day_of_week: "Monday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club2.id)
class153 = Group.create!(name: "True Barre" ,day_of_week: "Monday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club5.id)
class36 = Group.create!(name: "Precision Run" ,day_of_week: "Monday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club1.id)
class100 = Group.create!(name: "Precision Run" ,day_of_week: "Monday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club3.id)
class105 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Monday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club3.id)
class147 = Group.create!(name: "Precision Run" ,day_of_week: "Monday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club4.id)
class37 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Monday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club1.id)
class101 = Group.create!(name: "Athletic Stretch" ,day_of_week: "Monday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club3.id)
class148 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Monday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club4.id)
class45 = Group.create!(name: "Tabatha Max" ,day_of_week: "Tuesday" ,time: "07:00 am - 07:45 am" ,instructor_name: "Sally French" ,club_id: club2.id)
class156 = Group.create!(name: "Tabatha Max" ,day_of_week: "Tuesday" ,time: "07:00 am - 07:45 am" ,instructor_name: "Sally French" ,club_id: club5.id)
class1 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Tuesday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,club_id: club1.id)
class109 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Tuesday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club3.id)
class136 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Tuesday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club4.id)
class46 = Group.create!(name: "Stronger" ,day_of_week: "Tuesday" ,time: "09:30 am - 10:15 am" ,instructor_name: "Tim McGarrigal" ,club_id: club2.id)
class157 = Group.create!(name: "Stronger" ,day_of_week: "Tuesday" ,time: "09:30 am - 10:15 am" ,instructor_name: "Tim McGarrigal" ,club_id: club5.id)
class2 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Tuesday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club1.id)
class107 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Tuesday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club3.id)
class134 = Group.create!(name: "Athletic Conditioning" ,day_of_week: "Tuesday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club4.id)
class3 = Group.create!(name: "TRX Max" ,day_of_week: "Tuesday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club1.id)
class4 = Group.create!(name: "Slow Flow Yoga" ,day_of_week: "Tuesday" ,time: "04:00 pm - 05:00 pm" ,instructor_name: "Gustavo Rearte" ,club_id: club1.id)
class7 = Group.create!(name: "METCON 3" ,day_of_week: "Tuesday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club1.id)
class44 = Group.create!(name: "METCON 3" ,day_of_week: "Tuesday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club2.id)
class108 = Group.create!(name: "TRX Max" ,day_of_week: "Tuesday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club3.id)
class135 = Group.create!(name: "Boxing" ,day_of_week: "Tuesday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club4.id)
class155 = Group.create!(name: "METCON 3" ,day_of_week: "Tuesday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club5.id)
class5 = Group.create!(name: "True Barre" ,day_of_week: "Tuesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club1.id)
class47 = Group.create!(name: "Yoga Sculpt" ,day_of_week: "Tuesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club2.id)
class158 = Group.create!(name: "Yoga Sculpt" ,day_of_week: "Tuesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club5.id)
class110 = Group.create!(name: "Precision Run" ,day_of_week: "Tuesday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club3.id)
class137 = Group.create!(name: "Precision Run" ,day_of_week: "Tuesday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club4.id)
class6 = Group.create!(name: "Cycle Beats" ,day_of_week: "Tuesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club1.id)
class43 = Group.create!(name: "Cycle Beats" ,day_of_week: "Tuesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club2.id)
class111 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Tuesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club3.id)
class138 = Group.create!(name: "Athletic Stretch" ,day_of_week: "Tuesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club4.id)
class154 = Group.create!(name: "Cycle Beats" ,day_of_week: "Tuesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club5.id)
class8 = Group.create!(name: "Tabatha Max" ,day_of_week: "Wednesday" ,time: "07:00 am - 07:45 am" ,instructor_name: "Sally French" ,club_id: club1.id)
class50 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Wednesday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club2.id)
class75 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Wednesday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,club_id: club3.id)
class124 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Wednesday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club4.id)
class161 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Wednesday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club5.id)
class9 = Group.create!(name: "Stronger" ,day_of_week: "Wednesday" ,time: "09:30 am - 10:15 am" ,instructor_name: "Tim McGarrigal" ,club_id: club1.id)
class52 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Wednesday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club2.id)
class76 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Wednesday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club3.id)
class126 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Wednesday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club4.id)
class163 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Wednesday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club5.id)
class51 = Group.create!(name: "Circuit Training" ,day_of_week: "Wednesday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club2.id)
class77 = Group.create!(name: "TRX Max" ,day_of_week: "Wednesday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club3.id)
class125 = Group.create!(name: "Circuit Training" ,day_of_week: "Wednesday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club4.id)
class162 = Group.create!(name: "Circuit Training" ,day_of_week: "Wednesday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club5.id)
class78 = Group.create!(name: "Slow Flow Yoga" ,day_of_week: "Wednesday" ,time: "04:00 pm - 05:00 pm" ,instructor_name: "Gustavo Rearte" ,club_id: club3.id)
class10 = Group.create!(name: "Yoga Sculpt" ,day_of_week: "Wednesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club1.id)
class79 = Group.create!(name: "True Barre" ,day_of_week: "Wednesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club3.id)
class127 = Group.create!(name: "Cycle Beats" ,day_of_week: "Wednesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Kelsey Pfeffer" ,club_id: club4.id)
class12 = Group.create!(name: "Precision Run" ,day_of_week: "Wednesday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club1.id)
class49 = Group.create!(name: "Precision Run" ,day_of_week: "Wednesday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club2.id)
class160 = Group.create!(name: "Precision Run" ,day_of_week: "Wednesday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club5.id)
class11 = Group.create!(name: "Boxing" ,day_of_week: "Wednesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club1.id)
class48 = Group.create!(name: "Boxing" ,day_of_week: "Wednesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club2.id)
class128 = Group.create!(name: "Cardio Dance" ,day_of_week: "Wednesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Kenny Walter" ,club_id: club4.id)
class159 = Group.create!(name: "Boxing" ,day_of_week: "Wednesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club5.id)
class82 = Group.create!(name: "Tabatha Max" ,day_of_week: "Thursday" ,time: "07:00 am - 07:45 am" ,instructor_name: "Sally French" ,club_id: club3.id)
class119 = Group.create!(name: "Tabatha Max" ,day_of_week: "Thursday" ,time: "07:00 am - 07:45 am" ,instructor_name: "Sally French" ,club_id: club4.id)
class13 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Thursday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club1.id)
class57 = Group.create!(name: "Lower Body Blast" ,day_of_week: "Thursday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,club_id: club2.id)
class168 = Group.create!(name: "Lower Body Blast" ,day_of_week: "Thursday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,club_id: club5.id)
class83 = Group.create!(name: "Stronger" ,day_of_week: "Thursday" ,time: "09:30 am - 10:15 am" ,instructor_name: "Tim McGarrigal" ,club_id: club3.id)
class120 = Group.create!(name: "Stronger" ,day_of_week: "Thursday" ,time: "09:30 am - 10:15 am" ,instructor_name: "Tim McGarrigal" ,club_id: club4.id)
class15 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Thursday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club1.id)
class14 = Group.create!(name: "Circuit Training" ,day_of_week: "Thursday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club1.id)
class55 = Group.create!(name: "TRX Max" ,day_of_week: "Thursday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club2.id)
class166 = Group.create!(name: "TRX Max" ,day_of_week: "Thursday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club5.id)
class81 = Group.create!(name: "METCON 3" ,day_of_week: "Thursday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club3.id)
class118 = Group.create!(name: "METCON 3" ,day_of_week: "Thursday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club4.id)
class16 = Group.create!(name: "Cycle Beats" ,day_of_week: "Thursday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Kelsey Pfeffer" ,club_id: club1.id)
class53 = Group.create!(name: "Cycle Beats" ,day_of_week: "Thursday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Kelsey Pfeffer" ,club_id: club2.id)
class56 = Group.create!(name: "True Barre" ,day_of_week: "Thursday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club2.id)
class84 = Group.create!(name: "Yoga Sculpt" ,day_of_week: "Thursday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club3.id)
class121 = Group.create!(name: "Yoga Sculpt" ,day_of_week: "Thursday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club4.id)
class164 = Group.create!(name: "Cycle Beats" ,day_of_week: "Thursday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Kelsey Pfeffer" ,club_id: club5.id)
class167 = Group.create!(name: "True Barre" ,day_of_week: "Thursday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club5.id)
class123 = Group.create!(name: "Precision Run" ,day_of_week: "Thursday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club4.id)
class17 = Group.create!(name: "Cardio Dance" ,day_of_week: "Thursday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Kenny Walter" ,club_id: club1.id)
class54 = Group.create!(name: "Cardio Dance" ,day_of_week: "Thursday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Kenny Walter" ,club_id: club2.id)
class80 = Group.create!(name: "Cycle Beats" ,day_of_week: "Thursday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club3.id)
class122 = Group.create!(name: "Boxing" ,day_of_week: "Thursday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club4.id)
class165 = Group.create!(name: "Cardio Dance" ,day_of_week: "Thursday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Kenny Walter" ,club_id: club5.id)
class20 = Group.create!(name: "Lower Body Blast" ,day_of_week: "Friday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,club_id: club1.id)
class62 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Friday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club2.id)
class87 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Friday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club3.id)
class112 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Friday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,club_id: club4.id)
class173 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Friday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club5.id)
class60 = Group.create!(name: "Athletic Conditioning" ,day_of_week: "Friday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club2.id)
class89 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Friday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club3.id)
class113 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Friday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club4.id)
class171 = Group.create!(name: "Athletic Conditioning" ,day_of_week: "Friday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club5.id)
class18 = Group.create!(name: "TRX Max" ,day_of_week: "Friday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club1.id)
class88 = Group.create!(name: "Circuit Training" ,day_of_week: "Friday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club3.id)
class114 = Group.create!(name: "TRX Max" ,day_of_week: "Friday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club4.id)
class115 = Group.create!(name: "Slow Flow Yoga" ,day_of_week: "Friday" ,time: "04:00 pm - 05:00 pm" ,instructor_name: "Gustavo Rearte" ,club_id: club4.id)
class21 = Group.create!(name: "Boxing" ,day_of_week: "Friday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club1.id)
class58 = Group.create!(name: "Boxing" ,day_of_week: "Friday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club2.id)
class61 = Group.create!(name: "Boxing" ,day_of_week: "Friday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club2.id)
class169 = Group.create!(name: "Boxing" ,day_of_week: "Friday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club5.id)
class172 = Group.create!(name: "Boxing" ,day_of_week: "Friday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club5.id)
class19 = Group.create!(name: "True Barre" ,day_of_week: "Friday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club1.id)
class116 = Group.create!(name: "True Barre" ,day_of_week: "Friday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club4.id)
class63 = Group.create!(name: "Precision Run" ,day_of_week: "Friday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club2.id)
class86 = Group.create!(name: "Precision Run" ,day_of_week: "Friday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club3.id)
class22 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Friday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club1.id)
class59 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Friday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club2.id)
class85 = Group.create!(name: "Boxing" ,day_of_week: "Friday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club3.id)
class117 = Group.create!(name: "Cycle Beats" ,day_of_week: "Friday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club4.id)
class170 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Friday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club5.id)
class25 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Saturday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club1.id)
class67 = Group.create!(name: "Boxing" ,day_of_week: "Saturday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club2.id)
class94 = Group.create!(name: "Lower Body Blast" ,day_of_week: "Saturday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,club_id: club3.id)
class141 = Group.create!(name: "Boxing" ,day_of_week: "Saturday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club4.id)
class178 = Group.create!(name: "Boxing" ,day_of_week: "Saturday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,club_id: club5.id)
class23 = Group.create!(name: "Athletic Conditioning" ,day_of_week: "Saturday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club1.id)
class65 = Group.create!(name: "Barre" ,day_of_week: "Saturday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club2.id)
class139 = Group.create!(name: "Barre" ,day_of_week: "Saturday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club4.id)
class176 = Group.create!(name: "Barre" ,day_of_week: "Saturday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,club_id: club5.id)
class92 = Group.create!(name: "TRX Max" ,day_of_week: "Saturday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,club_id: club3.id)
class24 = Group.create!(name: "Boxing" ,day_of_week: "Saturday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club1.id)
class66 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Saturday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club2.id)
class140 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Saturday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club4.id)
class177 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Saturday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,club_id: club5.id)
class90 = Group.create!(name: "Cycle Beats" ,day_of_week: "Saturday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Kelsey Pfeffer" ,club_id: club3.id)
class93 = Group.create!(name: "True Barre" ,day_of_week: "Saturday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,club_id: club3.id)
class26 = Group.create!(name: "Precision Run" ,day_of_week: "Saturday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club1.id)
class68 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Saturday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club2.id)
class142 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Saturday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club4.id)
class174 = Group.create!(name: "Precision Run" ,day_of_week: "Saturday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club5.id)
class179 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Saturday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,club_id: club5.id)
class27 = Group.create!(name: "Athletic Stretch" ,day_of_week: "Saturday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club1.id)
class64 = Group.create!(name: "Athletic Stretch" ,day_of_week: "Saturday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club2.id)
class69 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Saturday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club2.id)
class91 = Group.create!(name: "Cardio Dance" ,day_of_week: "Saturday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Kenny Walter" ,club_id: club3.id)
class143 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Saturday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club4.id)
class175 = Group.create!(name: "Athletic Stretch" ,day_of_week: "Saturday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,club_id: club5.id)

class1.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class2.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class3.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class4.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class5.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "barre.jpg")
class6.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/cycling.jpg"), filename: "cycling.jpg")
class7.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class8.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class9.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/squat.jpg"), filename: "squat.jpg")
class10.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/sculpt.jpg"), filename: "sculpt.jpg")
class11.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class12.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class13.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class14.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/lunge.jpg"), filename: "lunge.jpg")
class15.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class16.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/cycling.jpg"), filename: "cycling.jpg")
class17.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/dance.jpg"), filename: "dance.jpg")
class18.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class19.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "barre.jpg")
class20.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/lunge.jpg"), filename: "lunge.jpg")
class21.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class22.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class23.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/squat.jpg"), filename: "squat.jpg")
class24.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class25.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class26.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class27.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/stretch.jpg"), filename: "stretch.jpg")
class28.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "barre.jpg")
class29.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class30.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class31.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class32.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class33.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class34.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class35.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class36.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class37.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class38.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class39.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class40.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class41.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class42.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "barre.jpg")
class43.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/cycling.jpg"), filename: "cycling.jpg")
class44.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class45.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class46.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/squat.jpg"), filename: "squat.jpg")
class47.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/sculpt.jpg"), filename: "sculpt.jpg")
class48.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class49.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class50.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class51.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/lunge.jpg"), filename: "lunge.jpg")
class52.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class53.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/cycling.jpg"), filename: "cycling.jpg")
class54.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/dance.jpg"), filename: "dance.jpg")
class55.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class56.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "barre.jpg")
class57.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/lunge.jpg"), filename: "lunge.jpg")
class58.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class59.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class60.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/squat.jpg"), filename: "squat.jpg")
class61.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class62.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class63.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class64.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/stretch.jpg"), filename: "squat.jpg")
class65.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "squat.jpg")
class66.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class67.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class68.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class69.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class70.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class71.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class72.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class73.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class74.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class75.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class76.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class77.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class78.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class79.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "barre.jpg")
class80.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/cycling.jpg"), filename: "cycling.jpg")
class81.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class82.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class83.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/squat.jpg"), filename: "squat.jpg")
class84.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/sculpt.jpg"), filename: "sculpt.jpg")
class85.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class86.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class87.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class88.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/lunge.jpg"), filename: "lunge.jpg")
class89.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class90.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/cycling.jpg"), filename: "cycling.jpg")
class91.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/dance.jpg"), filename: "dance.jpg")
class92.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class93.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "barre.jpg")
class94.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/lunge.jpg"), filename: "lunge.jpg")
class95.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class96.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class97.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/squat.jpg"), filename: "squat.jpg")
class98.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class99.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class100.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class101.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/stretch.jpg"), filename: "squat.jpg")
class102.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "squat.jpg")
class103.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class104.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class105.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class106.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class107.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class108.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class109.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class110.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class111.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class112.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class113.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class114.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class115.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class116.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "barre.jpg")
class117.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/cycling.jpg"), filename: "cycling.jpg")
class118.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class119.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class120.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/squat.jpg"), filename: "squat.jpg")
class121.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/sculpt.jpg"), filename: "sculpt.jpg")
class122.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class123.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class124.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class125.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/lunge.jpg"), filename: "lunge.jpg")
class126.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class127.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/cycling.jpg"), filename: "cycling.jpg")
class128.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/dance.jpg"), filename: "dance.jpg")
class129.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class130.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "barre.jpg")
class131.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/lunge.jpg"), filename: "lunge.jpg")
class132.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class133.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class134.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/squat.jpg"), filename: "squat.jpg")
class135.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class136.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class137.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class138.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/stretch.jpg"), filename: "squat.jpg")
class139.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "squat.jpg")
class140.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class141.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class142.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class143.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class144.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class145.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class146.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class147.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class148.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class149.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class150.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class151.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class152.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class153.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "barre.jpg")
class154.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/cycling.jpg"), filename: "cycling.jpg")
class155.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class156.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class157.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/squat.jpg"), filename: "squat.jpg")
class158.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/sculpt.jpg"), filename: "sculpt.jpg")
class159.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class160.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class161.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class162.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/lunge.jpg"), filename: "lunge.jpg")
class163.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class164.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/cycling.jpg"), filename: "cycling.jpg")
class165.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/dance.jpg"), filename: "dance.jpg")
class166.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class167.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "barre.jpg")
class168.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/lunge.jpg"), filename: "lunge.jpg")
class169.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class170.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class171.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/squat.jpg"), filename: "squat.jpg")
class172.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class173.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class174.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class175.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/stretch.jpg"), filename: "squat.jpg")
class176.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/barre.jpg"), filename: "squat.jpg")
class177.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class178.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/boxing.jpg"), filename: "boxing.jpg")
class179.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class180.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class181.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class182.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/group-class.jpg"), filename: "group.jpg")
class183.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/best-abs.jpg"), filename: "abs.jpg")
class184.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/running.jpg"), filename: "squat.jpg")
class185.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")

  puts "Done!"
