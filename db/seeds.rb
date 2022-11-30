# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Tag.destroy_all
Landmark.destroy_all
Route.destroy_all
Trip.destroy_all
User.destroy_all

user1 = User.create!(
  first_name: "John",
  last_name:  "Doe",
  email: "john@gmail.com",
  password: "password",
  bio: "Three years ago I quit my job and decised to backpack across the world. I wanted to visit at 100 countries before I turned 50."
)

trip1 = Trip.create!(
  title: "City to Valley - North to South of Chile in 2 weeks",
  location: "Chile",
  duration: 13,
  description: "Stunning diverse landscapes cover Chile all the way from the North to the South. Our 2 week Chile itinerary will take you through four regions: the wild south of Patagonia in Torres Del Paine National Park, the bohemian port city of Valparaiso, the mystical Elqui Valley where mountains are covered in cacti, and lastly to the Atacama Desert, considered one of the best places in the world for star gazing. Your 2 weeks in Chile will be filled with adventure!",
  likes: 124,
  user: user1,
)

Tag.create!(
  title: "Hiking",
  trip_id: trip1.id
)

Tag.create!(
  title: "Mountains",
  trip_id: trip1.id
)

Tag.create!(
  title: "City",
  trip_id: trip1.id
)

Tag.create!(
  title: "Dessert",
  trip_id: trip1.id
)

route0 = Route.create!(
  destination: "Santiago",
  method: "Plane",
  duration: 3,
  travel_date: "2022-11-10",
  trip_id: trip1.id
)

landmark0 = Landmark.new(
  title: "Oporto Steak Bar",
  location: " Isidora Goyenechea 3477, 7550106 Santiago, Las Condes, Región Metropolitana, Chile",
  description: "Get a taste of authentic Chile food at one of the best restaurants in the country. The meat was cooked to perfection and the service was of the highest quality.",
  route_id: route0.id
  # photo: open("res.cloudinary.com/dblvfwtds/image/upload/v1669735145/torres-del-paine_100659397dmitry-pichugin-shutterstock_2500x1250_tmhbce.jpg")
)
file0 = URI.open('https://res.cloudinary.com/dblvfwtds/image/upload/v1669812456/AVvXsEjCGj-r1XrZMVISbgmzUfsRIDu2sX7XPjO59XOn4f0loHgO4myEftEPgjYGiptJH9unmXL4GS26PTV5fV6gHwbRVq812zQZdwpL1f9TSeQHPfe-fsLtZbkjZ_pCMNivtt_1ABFBPhaEZSn_7P_Q8lF2OiBFBTsSTKnGFXvUu28D2imAC3d9Tq-7Ws3Ckg_w1200-h630-p-k-no-nu_nbhcfr.jpg')
landmark0.photo.attach(io: file0, filename: 'TorresDelPaine.jpg', content_type: 'image/jpg')
# puts "#{landmark.valid?}"
landmark0.save

route1 = Route.create!(
  destination: "Puerto Natales",
  method: "Plane",
  duration: 3,
  travel_date: "2022-11-11",
  trip_id: trip1.id
)

landmark1 = Landmark.new(
  title: "Torres del Paine National Park",
  location: "Torres de Paine, Magallanes and Chilean Antarctica, Chile",
  description: "A hiker's dream, this national park contains huge granite mountains surrounded by clear lakes and a series of well-maintained trails that vary in degree of difficulty.",
  route_id: route1.id
  # photo: open("res.cloudinary.com/dblvfwtds/image/upload/v1669735145/torres-del-paine_100659397dmitry-pichugin-shutterstock_2500x1250_tmhbce.jpg")
)
file1 = URI.open('https://res.cloudinary.com/dblvfwtds/image/upload/v1669735145/torres-del-paine_100659397dmitry-pichugin-shutterstock_2500x1250_tmhbce.jpg')
landmark1.photo.attach(io: file1, filename: 'TorresDelPaine.jpg', content_type: 'image/jpg')
# puts "#{landmark.valid?}"
landmark1.save

# file = open("app/assets/images/torres-del-paine.jpg")
# landmark.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
# landmark.save

# landmark.valid?

landmark2 = Landmark.create!(
  title: "Toore Patagonia Hotel",
  location: "Carlos Bories 228, 6160000 Puerto Natales, Natales, Magallanes y la Antártica Chilena, Chile",
  description: "After hiking in Torres Del Paine National park wind down in a fabulous spacious bungalow at Toore Patagonia. The bungalows are tastefully designed and the hotel has a wonderful locals craft store.",
  route_id: route1.id
)

file2 = URI.open('https://res.cloudinary.com/dblvfwtds/image/upload/v1669735603/88158990_av9cmk.jpg')
landmark2.photo.attach(io: file2, filename: 'lala.jpg', content_type: 'image/jpg')
landmark2.save

route2 = Route.create!(
  destination: "Valparaiso",
  method: "Plane",
  duration: 4,
  travel_date: "2022-11-14",
  trip_id: trip1.id
)

landmark3 = Landmark.create!(
  title: "Concepcion neighbourhood",
  location: "Cerro Concepción, Abtao 675, Valparaíso, Chile",
  description: "The best viewpoints, miradors and alleys are here and in these streets the richest cultural activities converge, surrounded by the best gastronomy. ",
  route_id: route2.id,
)

file3 = URI.open('https://res.cloudinary.com/dblvfwtds/image/upload/v1669735676/view-over-valparaiso_erpsvf.jpg')
landmark3.photo.attach(io: file3, filename: 'lala.jpg', content_type: 'image/jpg')
landmark3.save

landmark4 = Landmark.create!(
  title: "Winebox hotel",
  location: "Baquedano 763, Valparaíso, Chile",
  description: "Cook your own private dinner on the balcony of your room and have cocktails up on the rooftop.",
  route_id: route2.id
)

file4 = URI.open('https://res.cloudinary.com/dblvfwtds/image/upload/v1669735889/154548063_rjodgl.jpg')
landmark4.photo.attach(io: file4, filename: 'lala.jpg', content_type: 'image/jpg')
landmark4.save

landmark5 = Landmark.create!(
  title: "Funicular",
  location: "Errázuriz, Valparaíso, Chile",
  description: "Around 30 funiculars were constructed to connect the businesses of the Lower Town with the residential districts on the hills above. Take the funicular up the hills and walk down to explore different neighbourhoods.",
  route_id: route2.id
)

file5 = URI.open('https://res.cloudinary.com/dblvfwtds/image/upload/v1669735953/ei5qcGc_hycokk.jpg')
landmark5.photo.attach(io: file5, filename: 'lala.jpg', content_type: 'image/jpg')
landmark5.save

route3 = Route.create!(
  destination: "Pisco Elqui",
  method: "Car",
  duration: 7,
  travel_date: "2022-11-17",
  trip_id: trip1.id
)

landmark6 = Landmark.create!(
  title: "Pisco tour at the Mistral Pisco Distillery",
  location: "Paihuano, Coquimbo, Chile",
  description: "Tour of their vineyard and how they produce Pisco, two tastings, and a monogramed Pisco glass. Enjoy drinking Pisco Sours afterwards on their large outdoor terrace and eating fresh ceviche.",
  route_id: route3.id
)

file6 = URI.open('https://res.cloudinary.com/dblvfwtds/image/upload/v1669736053/anejamiento-en-barricas_xz7o6e.jpg')
landmark6.photo.attach(io: file6, filename: 'lala.jpg', content_type: 'image/jpg')
landmark6.save

route4 = Route.create!(
  destination: "Atacama Desert",
  method: "Bus",
  duration: 7,
  travel_date: "2022-11-19",
  trip_id: trip1.id
)

landmark7 = Landmark.create!(
  title: "Paranal Obervatory",
  location: "Taltal, Antofagasta, Chile",
  description: " get to see the telescope and where the astronomers work, we got to see their famous residence featured in the movie James Bond Quantum Solace! Even better, the tour is free. Space is limited since they only run tours on Saturdays.",
  route_id: route4.id
)

file7 = URI.open('https://res.cloudinary.com/dblvfwtds/image/upload/v1669736122/dauv_hude_aerial2_bbxloq.jpg')
landmark7.photo.attach(io: file7, filename: 'lala.jpg', content_type: 'image/jpg')
landmark7.save

landmark8 = Landmark.create!(
  title: "Atacama Desert Stargazing",
  location: "Cerro Armazones, Antofagasta, Chile",
  description: "The Original Stargazing Tour with the most personalized service, enjoy a unique experience in one of the cleanest and clearest skies in the world.",
  route_id: route4.id
)

file8 = URI.open('https://res.cloudinary.com/dblvfwtds/image/upload/v1669736250/47_bazjdw.jpg')
landmark8.photo.attach(io: file8, filename: 'lala.jpg', content_type: 'image/jpg')
landmark8.save


# second trip
