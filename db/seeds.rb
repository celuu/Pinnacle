# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


ActiveRecord::Base.connection.reset_pk_sequence!(:users)
ActiveRecord::Base.connection.reset_pk_sequence!(:groups)

require "open-uri"

ApplicationRecord.transaction do 
  puts "Destroying tables..."
  # Unnecessary if using `rails db:seed:replant`
  User.destroy_all

  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!('users')

  puts "Creating users..."
  # Create one user with an easy to remember username, email, and password:
  User.create!(
    username: 'Demo-lition', 
    fname: "Demo",
    lname: "User",
    email: 'demo@user.io', 
    password: 'password'
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

  puts "Creating groups"
class1 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Tuesday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,location: "Equinox Sports Club San Francisco")
class1.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class2 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Tuesday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Sports Club San Francisco")
# class2.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/pilates.jpg"), filename: "pilates.jpg")
class3 = Group.create!(name: "TRX Max" ,day_of_week: "Tuesday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Sports Club San Francisco")
# class3.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/squat.jpg"), filename: "squat.jpg")
class4 = Group.create!(name: "Slow Flow Yoga" ,day_of_week: "Tuesday" ,time: "04:00 pm - 05:00 pm" ,instructor_name: "Gustavo Rearte" ,location: "Equinox Sports Club San Francisco")
# class4.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class5 = Group.create!(name: "True Barre" ,day_of_week: "Tuesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Sports Club San Francisco")
class6 = Group.create!(name: "Cycle Beats" ,day_of_week: "Tuesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Sports Club San Francisco")
class7 = Group.create!(name: "METCON 3" ,day_of_week: "Tuesday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Sports Club San Francisco")
class8 = Group.create!(name: "Tabatha Max" ,day_of_week: "Wednesday" ,time: "07:00 am - 07:45 am" ,instructor_name: "Sally French" ,location: "Equinox Sports Club San Francisco")
class9 = Group.create!(name: "Stronger" ,day_of_week: "Wednesday" ,time: "09:30 am - 10:15 am" ,instructor_name: "Tim McGarrigal" ,location: "Equinox Sports Club San Francisco")
class10 = Group.create!(name: "Yoga Sculpt" ,day_of_week: "Wednesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Sports Club San Francisco")
class11 = Group.create!(name: "Boxing" ,day_of_week: "Wednesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Sports Club San Francisco")
class12 = Group.create!(name: "Precision Run" ,day_of_week: "Wednesday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Sports Club San Francisco")
class13 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Thursday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Sports Club San Francisco")
class14 = Group.create!(name: "Circuit Training" ,day_of_week: "Thursday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Sports Club San Francisco")
class15 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Thursday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Sports Club San Francisco")
class16 = Group.create!(name: "Cycle Beats" ,day_of_week: "Thursday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Kelsey Pfeffer" ,location: "Equinox Sports Club San Francisco")
class17 = Group.create!(name: "Cardio Dance" ,day_of_week: "Thursday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Kenny Walter" ,location: "Equinox Sports Club San Francisco")
class18 = Group.create!(name: "TRX Max" ,day_of_week: "Friday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Sports Club San Francisco")
class19 = Group.create!(name: "True Barre" ,day_of_week: "Friday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Sports Club San Francisco")
class20 = Group.create!(name: "Lower Body Blast" ,day_of_week: "Friday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,location: "Equinox Sports Club San Francisco")
class21 = Group.create!(name: "Boxing" ,day_of_week: "Friday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Sports Club San Francisco")
class22 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Friday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Sports Club San Francisco")
class23 = Group.create!(name: "Athletic Conditioning" ,day_of_week: "Saturday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Sports Club San Francisco")
class24 = Group.create!(name: "Boxing" ,day_of_week: "Saturday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Sports Club San Francisco")
class25 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Saturday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Sports Club San Francisco")
class26 = Group.create!(name: "Precision Run" ,day_of_week: "Saturday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Sports Club San Francisco")
class27 = Group.create!(name: "Athletic Stretch" ,day_of_week: "Saturday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Sports Club San Francisco")
class28 = Group.create!(name: "Barre" ,day_of_week: "Sunday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Sports Club San Francisco")
class29 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Sunday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Sports Club San Francisco")
class30 = Group.create!(name: "Boxing" ,day_of_week: "Sunday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Sports Club San Francisco")
class31 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Sunday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Sports Club San Francisco")
class32 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Sunday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Sports Club San Francisco")
# class32.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class33 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Monday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Sports Club San Francisco")
# class33.photo.attach(io: URI.open("https://pinnacle-seeds.s3.us-west-1.amazonaws.com/yoga.jpg"), filename: "yoga.jpg")
class34 = Group.create!(name: "TRX Max" ,day_of_week: "Monday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Sports Club San Francisco")
class35 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Monday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Sports Club San Francisco")
class36 = Group.create!(name: "Precision Run" ,day_of_week: "Monday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Sports Club San Francisco")
class37 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Monday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Sports Club San Francisco")
class38 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Tuesday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,location: "Equinox Pine Street")
class39 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Tuesday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Pine Street")
class40 = Group.create!(name: "TRX Max" ,day_of_week: "Tuesday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Pine Street")
class41 = Group.create!(name: "Slow Flow Yoga" ,day_of_week: "Tuesday" ,time: "04:00 pm - 05:00 pm" ,instructor_name: "Gustavo Rearte" ,location: "Equinox Pine Street")
class42 = Group.create!(name: "True Barre" ,day_of_week: "Tuesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Pine Street")
class43 = Group.create!(name: "Cycle Beats" ,day_of_week: "Tuesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Pine Street")
class44 = Group.create!(name: "METCON 3" ,day_of_week: "Tuesday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Pine Street")
class45 = Group.create!(name: "Tabatha Max" ,day_of_week: "Wednesday" ,time: "07:00 am - 07:45 am" ,instructor_name: "Sally French" ,location: "Equinox Pine Street")
class46 = Group.create!(name: "Stronger" ,day_of_week: "Wednesday" ,time: "09:30 am - 10:15 am" ,instructor_name: "Tim McGarrigal" ,location: "Equinox Pine Street")
class47 = Group.create!(name: "Yoga Sculpt" ,day_of_week: "Wednesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Pine Street")
class48 = Group.create!(name: "Boxing" ,day_of_week: "Wednesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Pine Street")
class49 = Group.create!(name: "Precision Run" ,day_of_week: "Wednesday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Pine Street")
class50 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Thursday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Pine Street")
class51 = Group.create!(name: "Circuit Training" ,day_of_week: "Thursday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Pine Street")
class52 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Thursday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Pine Street")
class53 = Group.create!(name: "Cycle Beats" ,day_of_week: "Thursday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Kelsey Pfeffer" ,location: "Equinox Pine Street")
class54 = Group.create!(name: "Cardio Dance" ,day_of_week: "Thursday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Kenny Walter" ,location: "Equinox Pine Street")
class55 = Group.create!(name: "TRX Max" ,day_of_week: "Friday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Pine Street")
class56 = Group.create!(name: "True Barre" ,day_of_week: "Friday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Pine Street")
class57 = Group.create!(name: "Lower Body Blast" ,day_of_week: "Friday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,location: "Equinox Pine Street")
class58 = Group.create!(name: "Boxing" ,day_of_week: "Friday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Pine Street")
class59 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Friday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Pine Street")
class60 = Group.create!(name: "Athletic Conditioning" ,day_of_week: "Saturday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Pine Street")
class61 = Group.create!(name: "Boxing" ,day_of_week: "Saturday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Pine Street")
class62 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Saturday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Pine Street")
class63 = Group.create!(name: "Precision Run" ,day_of_week: "Saturday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Pine Street")
class64 = Group.create!(name: "Athletic Stretch" ,day_of_week: "Saturday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Pine Street")
class65 = Group.create!(name: "Barre" ,day_of_week: "Sunday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Pine Street")
class66 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Sunday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Pine Street")
class67 = Group.create!(name: "Boxing" ,day_of_week: "Sunday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Pine Street")
class68 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Sunday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Pine Street")
class69 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Sunday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Pine Street")
class70 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Monday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Pine Street")
class71 = Group.create!(name: "TRX Max" ,day_of_week: "Monday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Pine Street")
class72 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Monday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Pine Street")
class73 = Group.create!(name: "Precision Run" ,day_of_week: "Monday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Pine Street")
class74 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Monday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Pine Street")
class75 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Tuesday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,location: "Equinox Union Street")
class76 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Tuesday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Union Street")
class77 = Group.create!(name: "TRX Max" ,day_of_week: "Tuesday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Union Street")
class78 = Group.create!(name: "Slow Flow Yoga" ,day_of_week: "Tuesday" ,time: "04:00 pm - 05:00 pm" ,instructor_name: "Gustavo Rearte" ,location: "Equinox Union Street")
class79 = Group.create!(name: "True Barre" ,day_of_week: "Tuesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Union Street")
class80 = Group.create!(name: "Cycle Beats" ,day_of_week: "Tuesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Union Street")
class81 = Group.create!(name: "METCON 3" ,day_of_week: "Tuesday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Union Street")
class82 = Group.create!(name: "Tabatha Max" ,day_of_week: "Wednesday" ,time: "07:00 am - 07:45 am" ,instructor_name: "Sally French" ,location: "Equinox Union Street")
class83 = Group.create!(name: "Stronger" ,day_of_week: "Wednesday" ,time: "09:30 am - 10:15 am" ,instructor_name: "Tim McGarrigal" ,location: "Equinox Union Street")
class84 = Group.create!(name: "Yoga Sculpt" ,day_of_week: "Wednesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Union Street")
class85 = Group.create!(name: "Boxing" ,day_of_week: "Wednesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Union Street")
class86 = Group.create!(name: "Precision Run" ,day_of_week: "Wednesday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Union Street")
class87 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Thursday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Union Street")
class88 = Group.create!(name: "Circuit Training" ,day_of_week: "Thursday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Union Street")
class89 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Thursday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Union Street")
class90 = Group.create!(name: "Cycle Beats" ,day_of_week: "Thursday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Kelsey Pfeffer" ,location: "Equinox Union Street")
class91 = Group.create!(name: "Cardio Dance" ,day_of_week: "Thursday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Kenny Walter" ,location: "Equinox Union Street")
class92 = Group.create!(name: "TRX Max" ,day_of_week: "Friday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Union Street")
class93 = Group.create!(name: "True Barre" ,day_of_week: "Friday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Union Street")
class94 = Group.create!(name: "Lower Body Blast" ,day_of_week: "Friday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,location: "Equinox Union Street")
class95 = Group.create!(name: "Boxing" ,day_of_week: "Friday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Union Street")
class96 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Friday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Union Street")
class97 = Group.create!(name: "Athletic Conditioning" ,day_of_week: "Saturday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Union Street")
class98 = Group.create!(name: "Boxing" ,day_of_week: "Saturday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Union Street")
class99 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Saturday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Union Street")
class100 = Group.create!(name: "Precision Run" ,day_of_week: "Saturday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Union Street")
class101 = Group.create!(name: "Athletic Stretch" ,day_of_week: "Saturday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Union Street")
class102 = Group.create!(name: "Barre" ,day_of_week: "Sunday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Union Street")
class103 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Sunday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Union Street")
class104 = Group.create!(name: "Boxing" ,day_of_week: "Sunday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Union Street")
class105 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Sunday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Union Street")
class106 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Sunday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Union Street")
class107 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Monday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Union Street")
class108 = Group.create!(name: "TRX Max" ,day_of_week: "Monday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Union Street")
class109 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Monday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Union Street")
class110 = Group.create!(name: "Precision Run" ,day_of_week: "Monday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Union Street")
class111 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Monday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Union Street")
class112 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Tuesday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,location: "Equinox Beale Street")
class113 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Tuesday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Beale Street")
class114 = Group.create!(name: "TRX Max" ,day_of_week: "Tuesday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Beale Street")
class115 = Group.create!(name: "Slow Flow Yoga" ,day_of_week: "Tuesday" ,time: "04:00 pm - 05:00 pm" ,instructor_name: "Gustavo Rearte" ,location: "Equinox Beale Street")
class116 = Group.create!(name: "True Barre" ,day_of_week: "Tuesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Beale Street")
class117 = Group.create!(name: "Cycle Beats" ,day_of_week: "Tuesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Beale Street")
class118 = Group.create!(name: "METCON 3" ,day_of_week: "Tuesday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Beale Street")
class119 = Group.create!(name: "Tabatha Max" ,day_of_week: "Wednesday" ,time: "07:00 am - 07:45 am" ,instructor_name: "Sally French" ,location: "Equinox Beale Street")
class120 = Group.create!(name: "Stronger" ,day_of_week: "Wednesday" ,time: "09:30 am - 10:15 am" ,instructor_name: "Tim McGarrigal" ,location: "Equinox Beale Street")
class121 = Group.create!(name: "Yoga Sculpt" ,day_of_week: "Wednesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Beale Street")
class122 = Group.create!(name: "Boxing" ,day_of_week: "Wednesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Beale Street")
class123 = Group.create!(name: "Precision Run" ,day_of_week: "Wednesday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Beale Street")
class124 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Thursday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Beale Street")
class125 = Group.create!(name: "Circuit Training" ,day_of_week: "Thursday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Beale Street")
class126 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Thursday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Beale Street")
class127 = Group.create!(name: "Cycle Beats" ,day_of_week: "Thursday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Kelsey Pfeffer" ,location: "Equinox Beale Street")
class128 = Group.create!(name: "Cardio Dance" ,day_of_week: "Thursday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Kenny Walter" ,location: "Equinox Beale Street")
class129 = Group.create!(name: "TRX Max" ,day_of_week: "Friday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Beale Street")
class130 = Group.create!(name: "True Barre" ,day_of_week: "Friday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Beale Street")
class131 = Group.create!(name: "Lower Body Blast" ,day_of_week: "Friday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,location: "Equinox Beale Street")
class132 = Group.create!(name: "Boxing" ,day_of_week: "Friday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Beale Street")
class133 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Friday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Beale Street")
class134 = Group.create!(name: "Athletic Conditioning" ,day_of_week: "Saturday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Beale Street")
class135 = Group.create!(name: "Boxing" ,day_of_week: "Saturday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Beale Street")
class136 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Saturday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Beale Street")
class137 = Group.create!(name: "Precision Run" ,day_of_week: "Saturday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Beale Street")
class138 = Group.create!(name: "Athletic Stretch" ,day_of_week: "Saturday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Beale Street")
class139 = Group.create!(name: "Barre" ,day_of_week: "Sunday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Beale Street")
class140 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Sunday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Beale Street")
class141 = Group.create!(name: "Boxing" ,day_of_week: "Sunday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Beale Street")
class142 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Sunday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Beale Street")
class143 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Sunday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Beale Street")
class144 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Monday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Beale Street")
class145 = Group.create!(name: "TRX Max" ,day_of_week: "Monday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Beale Street")
class146 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Monday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Beale Street")
class147 = Group.create!(name: "Precision Run" ,day_of_week: "Monday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Beale Street")
class148 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Monday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Beale Street")
class149 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Tuesday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,location: "Equinox Van Mission")
class150 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Tuesday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Van Mission")
class151 = Group.create!(name: "TRX Max" ,day_of_week: "Tuesday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Van Mission")
class152 = Group.create!(name: "Slow Flow Yoga" ,day_of_week: "Tuesday" ,time: "04:00 pm - 05:00 pm" ,instructor_name: "Gustavo Rearte" ,location: "Equinox Van Mission")
class153 = Group.create!(name: "True Barre" ,day_of_week: "Tuesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Van Mission")
class154 = Group.create!(name: "Cycle Beats" ,day_of_week: "Tuesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Van Mission")
class155 = Group.create!(name: "METCON 3" ,day_of_week: "Tuesday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Van Mission")
class156 = Group.create!(name: "Tabatha Max" ,day_of_week: "Wednesday" ,time: "07:00 am - 07:45 am" ,instructor_name: "Sally French" ,location: "Equinox Van Mission")
class157 = Group.create!(name: "Stronger" ,day_of_week: "Wednesday" ,time: "09:30 am - 10:15 am" ,instructor_name: "Tim McGarrigal" ,location: "Equinox Van Mission")
class158 = Group.create!(name: "Yoga Sculpt" ,day_of_week: "Wednesday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Van Mission")
class159 = Group.create!(name: "Boxing" ,day_of_week: "Wednesday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Van Mission")
class160 = Group.create!(name: "Precision Run" ,day_of_week: "Wednesday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Van Mission")
class161 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Thursday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Van Mission")
class162 = Group.create!(name: "Circuit Training" ,day_of_week: "Thursday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Van Mission")
class163 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Thursday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Van Mission")
class164 = Group.create!(name: "Cycle Beats" ,day_of_week: "Thursday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Kelsey Pfeffer" ,location: "Equinox Van Mission")
class165 = Group.create!(name: "Cardio Dance" ,day_of_week: "Thursday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Kenny Walter" ,location: "Equinox Van Mission")
class166 = Group.create!(name: "TRX Max" ,day_of_week: "Friday" ,time: "12:15 pm - 01:00 pm" ,instructor_name: "Stephanie Vu" ,location: "Equinox Van Mission")
class167 = Group.create!(name: "True Barre" ,day_of_week: "Friday" ,time: "05:30 pm - 06:15 pm" ,instructor_name: "Colette Hernandez" ,location: "Equinox Van Mission")
class168 = Group.create!(name: "Lower Body Blast" ,day_of_week: "Friday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Rayson Yam" ,location: "Equinox Van Mission")
class169 = Group.create!(name: "Boxing" ,day_of_week: "Friday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Van Mission")
class170 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Friday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Van Mission")
class171 = Group.create!(name: "Athletic Conditioning" ,day_of_week: "Saturday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Van Mission")
class172 = Group.create!(name: "Boxing" ,day_of_week: "Saturday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Van Mission")
class173 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Saturday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Van Mission")
class174 = Group.create!(name: "Precision Run" ,day_of_week: "Saturday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Van Mission")
class175 = Group.create!(name: "Athletic Stretch" ,day_of_week: "Saturday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Van Mission")
class176 = Group.create!(name: "Barre" ,day_of_week: "Sunday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Van Mission")
class177 = Group.create!(name: "Best Butt Ever" ,day_of_week: "Sunday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Van Mission")
class178 = Group.create!(name: "Boxing" ,day_of_week: "Sunday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Van Mission")
class179 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Sunday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Van Mission")
class180 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Sunday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Van Mission")
class181 = Group.create!(name: "Vinyasa Yoga" ,day_of_week: "Monday" ,time: "10:00 am - 10:45 am" ,instructor_name: "Precious Moreno" ,location: "Equinox Van Mission")
class182 = Group.create!(name: "TRX Max" ,day_of_week: "Monday" ,time: "04:15 pm - 05:00 pm" ,instructor_name: "Fady Asaad" ,location: "Equinox Van Mission")
class183 = Group.create!(name: "Best Abs Ever" ,day_of_week: "Monday" ,time: "07:30 am - 08:30 am" ,instructor_name: "Colette Hernandez" ,location: "Equinox Van Mission")
class184 = Group.create!(name: "Precision Run" ,day_of_week: "Monday" ,time: "06:00 pm - 06:45 pm" ,instructor_name: "Mark Protacio" ,location: "Equinox Van Mission")
class185 = Group.create!(name: "Pilates Fusion" ,day_of_week: "Monday" ,time: "06:30 pm - 07:20 pm" ,instructor_name: "Helen Saunders" ,location: "Equinox Van Mission")

  puts "Done!"
end