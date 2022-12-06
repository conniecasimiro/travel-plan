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
hiking = Tag.create!(
  title: "Hiking"
)

mountains = Tag.create!(
  title: "Mountains"
)

city = Tag.create!(
  title: "City"
)

jungle = Tag.create!(
  title: "Jungle"
)

beach = Tag.create!(
  title: "Beach"
)



user1 = User.create!(
  first_name: "John",
  last_name:  "Doe",
  email: "john@gmail.com",
  password: "password",
  bio: "Three years ago I quit my job and decised to backpack across the world. I wanted to visit at 100 countries before I turned 50."
)

user1file1 = URI.open('https://mensline.org.au/wp-content/uploads/2020/05/Excuses-header-1024x683.jpg')
user1.photo.attach(io: user1file1, filename: 'TorresDelPaine.jpg', content_type: 'image/jpg')
user1file2 = URI.open('https://www.campusfrance.org/sites/default/files/styles/mobile_visuel_principal_page/public/medias/images/2022-02/Ocean.jpg?itok=tHyKsBah')
user1.coverphoto.attach(io: user1file2, filename: 'TorresDelPaine.jpg', content_type: 'image/jpg')
user1.save

trip1 = Trip.create!(
  title: "City to Valley - North to South of Chile",
  location: "Chile",
  duration: 13,
  description: "Stunning diverse landscapes cover Chile all the way from the North to the South. Our 2 week Chile itinerary will take you through four regions: the wild south of Patagonia in Torres Del Paine National Park, the bohemian port city of Valparaiso, the mystical Elqui Valley where mountains are covered in cacti, and lastly to the Atacama Desert, considered one of the best places in the world for star gazing. Your 2 weeks in Chile will be filled with adventure!",
  likes: 124,
  user: user1,
)
trip1.tags.push(hiking)
trip1.tags.push(mountains)
trip1.tags.push(beach)

route0 = Route.create!(
  destination: "Puerto Natales",
  method: "first_location",
  duration: "2",
  travel_date: "2022-11-10",
  trip_id: trip1.id
)

landmark0 = Landmark.new(
  title: "Torres del Paine National Park",
  location: "Torres de Paine, Magallanes and Chilean Antarctica, Chile",
  description: "A hiker's dream, this national park contains huge granite mountains surrounded by clear lakes and a series of well-maintained trails that vary in degree of difficulty.",
  route_id: route0.id
  # photo: open("res.cloudinary.com/dblvfwtds/image/upload/v1669735145/torres-del-paine_100659397dmitry-pichugin-shutterstock_2500x1250_tmhbce.jpg")
)
file0 = URI.open('https://res.cloudinary.com/dblvfwtds/image/upload/v1669735145/torres-del-paine_100659397dmitry-pichugin-shutterstock_2500x1250_tmhbce.jpg')
landmark0.photo.attach(io: file0, filename: 'TorresDelPaine.jpg', content_type: 'image/jpg')
# puts "#{landmark.valid?}"
landmark0.save

# file = open("app/assets/images/torres-del-paine.jpg")
# landmark.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
# landmark.save

# landmark.valid?

landmark1 = Landmark.create!(
  title: "Toore Patagonia Hotel",
  location: "Carlos Bories 228, 6160000 Puerto Natales, Natales, Magallanes y la Antártica Chilena, Chile",
  description: "After hiking in Torres Del Paine National park wind down in a fabulous spacious bungalow at Toore Patagonia. The bungalows are tastefully designed and the hotel has a wonderful locals craft store.",
  route_id: route0.id
)

file1 = URI.open('https://res.cloudinary.com/dblvfwtds/image/upload/v1669735603/88158990_av9cmk.jpg')
landmark1.photo.attach(io: file1, filename: 'lala.jpg', content_type: 'image/jpg')
landmark1.save

route1 = Route.create!(
  destination: "Santiago, Chile",
  method: "Plane",
  duration: 3,
  travel_date: "2022-11-13",
  trip_id: trip1.id
)

landmark2 = Landmark.new(
  title: "Oporto Steak Bar",
  location: " Isidora Goyenechea 3477, 7550106 Santiago, Las Condes, Región Metropolitana, Chile",
  description: "Get a taste of authentic Chile food at one of the best restaurants in the country. The meat was cooked to perfection and the service was of the highest quality.",
  route_id: route1.id
  # photo: open("res.cloudinary.com/dblvfwtds/image/upload/v1669735145/torres-del-paine_100659397dmitry-pichugin-shutterstock_2500x1250_tmhbce.jpg")
)
file2 = URI.open('https://res.cloudinary.com/dblvfwtds/image/upload/v1669812456/AVvXsEjCGj-r1XrZMVISbgmzUfsRIDu2sX7XPjO59XOn4f0loHgO4myEftEPgjYGiptJH9unmXL4GS26PTV5fV6gHwbRVq812zQZdwpL1f9TSeQHPfe-fsLtZbkjZ_pCMNivtt_1ABFBPhaEZSn_7P_Q8lF2OiBFBTsSTKnGFXvUu28D2imAC3d9Tq-7Ws3Ckg_w1200-h630-p-k-no-nu_nbhcfr.jpg')
landmark2.photo.attach(io: file2, filename: 'TorresDelPaine.jpg', content_type: 'image/jpg')
# puts "#{landmark.valid?}"
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
  description: "Get to see the telescope and where the astronomers work, we got to see their famous residence featured in the movie James Bond Quantum Solace! Even better, the tour is free.",
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

trip2 = Trip.create!(
  title: "Exploring Costa Rica",
  location: "Costa Rica",
  duration: 14,
  description: "Costa Rica is a rugged, rainforested Central American country with coastlines on the Caribbean and Pacific. Though its capital, San Jose, is home to cultural institutions like the Pre-Columbian Gold Museum, Costa Rica is known for its beaches, volcanoes, and biodiversity. Roughly a quarter of its area is made up of protected jungle, teeming with wildlife including spider monkeys and quetzal birds.",
  likes: 132,
  user: user1,
)
trip2.tags.push(hiking)
trip2.tags.push(mountains)
trip2.tags.push(jungle)


route5 = Route.create!(
  destination: "San José",
  method: "first_location",
  duration: "2",
  travel_date: "2022-01-5",
  trip_id: trip2.id
)

landmark9 = Landmark.new(
  title: "Buena Vista Chic Hotel",
  location: "Pilas, Alajuela Province, San Isidro, Costa Rica",
  description: "Built in a Spanish colonial style, this charming resort offers spacious rooms with free Wi-Fi, satellite TV and a fan. The private bathrooms include a hairdryer. The Buena Vista has a bar and an elegant restaurant, where international cuisine is served. A tropical continental breakfast is included.",
  route_id: route5.id
)
file9 = URI.open('https://cf.bstatic.com/xdata/images/hotel/max1280x900/241543557.jpg?k=2f19d88a12eb2bca4db3138beade459381b33af53908221e8daf76f52a3609ca&o=&hp=1')
landmark9.photo.attach(io: file9, filename: 'TorresDelPaine.jpg', content_type: 'image/jpg')
landmark9.save

route6 = Route.create!(
  destination: "Tortuguero",
  method: "Car",
  duration: 4,
  travel_date: "2022-01-6",
  trip_id: trip2.id
)

landmark10 = Landmark.create!(
  title: "Tortuguero National Park",
  location: "Playa Bonita, Costa Rica",
  description: "Once aboard for the approximately 90-minute trip, you can relax and enjoy the ambiance as you zip along the calm waters—maybe make a game of spotting fish and birds as you enter Tortuguero National Park",
  route_id: route6.id
)

file10 = URI.open('https://cdn.kimkim.com/files/a/images/10d92a375736c0f9aec2f86397ce8e6bfcb21bcc/big-42a14af246f22171cdddec2479bd3009.jpg')
landmark10.photo.attach(io: file10, filename: 'lala.jpg', content_type: 'image/jpg')
landmark10.save

landmark11 = Landmark.new(
  title: "Turtle Spotting ",
  location: " Limón Province, Costa Rica",
  description: "Hop in a canoe and navigate the network of arterial waterways that snake around this 77,032-acre protected area. Keep your camera at the ready because you'll be on the hunt for various denizens of the reserve.",
  route_id: route6.id
  )
file11 = URI.open('https://cdn.kimkim.com/files/a/trip_plan/days/photos/6f4f9adcdeceb93279f81207fbbc8e3b87b85a6d/big-a24c39f8a22fa87ffdc03155714edf45.jpg')
landmark11.photo.attach(io: file11, filename: 'TorresDelPaine.jpg', content_type: 'image/jpg')
landmark11.save

route7 = Route.create!(
  destination: "La Fortuna",
  method: "Car",
  duration: 2,
  travel_date: "2022-01-08",
  trip_id: trip2.id
)

landmark12 = Landmark.new(
  title: "Whitewater Rafting",
  location: "Río Agua Caliente, Alajuela Province, San Carlos, Costa Rica",
  description: "After a lesson from your professional guide, you'll begin the seven-mile river journey featuring over 30 class III and IV rapids. About halfway through the trip, you’ll take a break on shore for some refreshing tropical fruit and a traditional Costa Rican lunch.",
  route_id: route7.id
  # photo: open("res.cloudinary.com/dblvfwtds/image/upload/v1669735145/torres-del-paine_100659397dmitry-pichugin-shutterstock_2500x1250_tmhbce.jpg")
)
file12 = URI.open('https://cdn.kimkim.com/files/a/images/b25b88290d2ecd9e322f6775b4e38db9fc30f814/big-ce55ab6c0f0c0fb6ce31158eb5468a78.jpg')
landmark12.photo.attach(io: file12, filename: 'TorresDelPaine.jpg', content_type: 'image/jpg')
# puts "#{landmark.valid?}"
landmark12.save

landmark13 = Landmark.create!(
  title: "Tabacón Hot Springs",
  location: "Calle 470, Provincia de Alajuela, La Fortuna, 21007, Costa Rica",
  description: " soothe your muscles with a dip in the mineral-rich waters in and around the Tabacón Thermal Resort. These hot springs have been used as therapeutic baths for more than 200 years, and the resort includes a spa where various treatments, like couples massages. ",
  route_id: route7.id
)

file13 = URI.open('https://www.tabacon.com/wp-content/uploads/2020/11/morning-pass.jpg')
landmark13.photo.attach(io: file13, filename: 'lala.jpg', content_type: 'image/jpg')
landmark13.save

landmark14 = Landmark.create!(
  title: "Hike Arenal 1968 ",
  location: "Arenal Volcano, Alajuela Province, San Carlos, Costa Rica",
  description: "A private reserve named after the year of the last major eruption of the volcano. The event was so catastrophic that it transformed some of the region’s topography: lava fields now dominate one side of Arenal. Hiking trails wind through those lava fields.",
  route_id: route7.id
)

file14 = URI.open('https://arenal1968.com/wp-content/uploads/2018/09/arenal1968_banner_9.jpg')
landmark14.photo.attach(io: file14, filename: 'lala.jpg', content_type: 'image/jpg')
landmark14.save

landmark15 = Landmark.create!(
  title: "Chocolate Experience",
  location: "Catarata Río Fortuna, Provincia de Alajuela, San Carlos, Costa Rica",
  description: "with a two-hour, hands-on tour in which you’ll learn about the origin, history, and production of one of Costa Rica's most famous exports: chocolate. You'll participate in the cacao harvest as well as the drying and grinding of the seeds.",
  route_id: route7.id
)

file15 = URI.open('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/33/e1/7d/photo7jpg.jpg?w=1200&h=900&s=1')
landmark15.photo.attach(io: file15, filename: 'lala.jpg', content_type: 'image/jpg')
landmark15.save

route8 = Route.create!(
  destination: "Monteverde, Costa Rica",
  method: "Ferry",
  duration: 3,
  travel_date: "2022-01-11",
  trip_id: trip2.id
)

landmark16 = Landmark.create!(
  title: "Sky Adventures Monteverde",
  location: "Provincia de Puntarenas, Monteverde, 60109, Costa Rica",
  description: "Its Sky Tram network of gondolas transport visitors from one adrenaline pumping activity to another. First, you'll start with a guided Sky Walk, which combines trails and suspension bridges that ultimately reach heights of up to 984 feet above the jungle canopy.",
  route_id: route8.id
)

file16 = URI.open('https://cdn.kimkim.com/files/a/images/c329dbcb7a2b20c0317df7d0e60a6e4dc422a36e/big-39c481f3722f371bf699528fae1d8b2b.jpg')
landmark16.photo.attach(io: file16, filename: 'lala.jpg', content_type: 'image/jpg')
landmark16.save

landmark17 = Landmark.create!(
  title: "Cloud Forest Reserve Guided Hike ",
  location: "Reserva de Monteverde, Provincia de Puntarenas, Monteverde, Costa Rica",
  description: "One of the jewels in Costa Rica's ecological crown. Known as the 'green lung of Costa Rica' due to its rich biodiversity, this 26,000-acre reserve is located high in the mountainous northwest region of the country, and thus receives much precipitation.",
  route_id: route8.id
)

file17 = URI.open('https://cdn.kimkim.com/files/a/images/b52d04daf6a9069b28a92748f8799dfb975a0103/big-905dfcebdbef455048262513164dd9e4.jpg')
landmark17.photo.attach(io: file17, filename: 'lala.jpg', content_type: 'image/jpg')
landmark17.save

route9 = Route.create!(
  destination: "Gulf of Papagayo",
  method: "Car",
  duration: 4,
  travel_date: "2022-01-14",
  trip_id: trip2.id
)

landmark18 = Landmark.create!(
  title: "Sunset Catamaran Cruise",
  location: "Calle Jobito, Provincia de Guanacaste, Coco, Costa Rica",
  description: "The ship will stop in a tranquil bay, drop anchor, and you'll explore the crystalline waters while the crew prepares a dinner feast. While you eat, enjoy the sunset over the Pacific horizon while keeping a sharp eye out for dolphins, sea turtles, flying fish.",
  route_id: route9.id
)

file18 = URI.open('https://cdn.kimkim.com/files/a/trip_plan/days/photos/3140c95f54e893d02c4b3c5379271c2c25d0204f/big-04b7136a6e1dcc91ad2d6c4290e5dc40.jpg')
landmark18.photo.attach(io: file18, filename: 'lala.jpg', content_type: 'image/jpg')
landmark18.save


#third trip

trip3 = Trip.create!(
  title: "Becoming an Arepa",
  location: "Venezuela",
  duration: 2404,
  description: "Venezuela is a country on the northern coast of South America with diverse natural attractions. Along its Caribbean coast are tropical resort islands including Isla de Margarita and the Los Roques archipelago.",
  likes: 13241,
  user: user1,
)

trip3.tags.push(beach)
trip3.tags.push(city)


route10 = Route.create!(
  destination: "Petare",
  method: "first_location",
  duration: "2",
  travel_date: "2022-01-14",
  trip_id: trip3.id
)

landmark20 = Landmark.create!(
  title: "Training",
  location: "Calle Sucre, Caracas 1020, Distrito Capital, Venezuela",
  description: "Dulce Nombre de Jesus de Petare is a neighborhood in Miranda, Venezuela, and is part of the Metropolitan District of Caracas. It is located in the Sucre Municipality, one of the five divisions of Caracas.",
  route_id: route10.id
)

file20 = URI.open('https://cdn.shortpixel.ai/spai/w_1029+q_lossy+ret_img+to_auto/https://cdn.cronica.uno/wp-content/uploads/2022/02/18083847/Petare-401_38_00000-1920x1136.jpg')
landmark20.photo.attach(io: file20, filename: 'lala.jpg', content_type: 'image/jpg')
landmark20.save

landmark21 = Landmark.create!(
  title: "Art",
  location: "Caracas 1080, Miranda, Venezuela",
  description: "Beautiful art museum in the heart of Caracas, Venezuela definitely recommended",
  route_id: route10.id
)

file21 = URI.open('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRq9cMQsz__tGbskreCfgebPxjbgIB3d6_SeyvdbE6AzVku0dRCDelGynV-dDyaqfdwmcWjXkx0pJASzA')
landmark21.photo.attach(io: file21, filename: 'lala.jpg', content_type: 'image/jpg')
landmark21.save


route11 = Route.create!(
  destination: "Maturin",
  method: "Plane",
  duration: 4,
  travel_date: "2022-12-14",
  trip_id: trip3.id
)

landmark22 = Landmark.create!(
  title: "Art yay",
  location: "Maturin, Venezuela",
  description: "A night view of fountain in Redoma Juana La Avanzadora",
  route_id: route11.id
)

file22 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Redoma_Juana_La_Avanzadora_%28Noche%29.JPG/2560px-Redoma_Juana_La_Avanzadora_%28Noche%29.JPG')
landmark22.photo.attach(io: file22, filename: 'lala.jpg', content_type: 'image/jpg')
landmark22.save

landmark23 = Landmark.create!(
  title: "Zoo",
  location: "Zona Industrial, Maturin 6201, Monagas, Venezuela",
  description: "La Guaricha Zoological Park",
  route_id: route11.id
)

file23 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Plaza_los_escritores_de_Maturin_2017.jpg/1920px-Plaza_los_escritores_de_Maturin_2017.jpg')
landmark23.photo.attach(io: file23, filename: 'lala.jpg', content_type: 'image/jpg')
landmark23.save

route12 = Route.create!(
  destination: "Los Medanos de Coro",
  method: "Motorcycle",
  duration: 1,
  travel_date: "2022-12-14",
  trip_id: trip3.id
)

landmark24 = Landmark.create!(
  title: "The Desert of Venezuela",
  location: "Coro, Venezuela",
  description: "Los medanos de Coro is considered one of the most distinguished landscape of Venezuela since it is the only dessert found in this country",
  route_id: route12.id
)

file24 = URI.open('https://lacgeo.com/sites/default/files/styles/large/public/medanos_de_coro_park_venezuela_opt.jpg?itok=q20fP1ca')
landmark24.photo.attach(io: file24, filename: 'lala.jpg', content_type: 'image/jpg')
landmark24.save

puts "Seed completed succesfully!"
