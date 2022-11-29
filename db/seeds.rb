# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
  duration: 14,
  description: "Stunning diverse landscapes cover Chile all the way from the North to the South. Our 2 week Chile itinerary will take you through four regions: the wild south of Patagonia in Torres Del Paine National Park, the bohemian port city of Valparaiso, the mystical Elqui Valley where mountains are covered in cacti, and lastly to the Atacama Desert, considered one of the best places in the world for star gazing. Your 2 weeks in Chile will be filled with adventure!",
  likes: 124,
  user_id: user1.id
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

Landmark.create!(
  title: "Torres del Paine National Park",
  location: "Puerto Natales",
  description: "A hiker's dream, this national park contains huge granite mountains surrounded by clear lakes and a series of well-maintained trails that vary in degree of difficulty.",
  trip_id: trip1.id
)

Landmark.create!(
  title: "Toore Patagonia Hotel",
  location: "Puerto Natales",
  description: "After hiking in Torres Del Paine National park wind down in a fabulous spacious bungalow at Toore Patagonia. The bungalows are tastefully designed and the hotel has a wonderful locals craft store.",
  trip_id: trip1.id
)

Route.create!(
  start_point: "Santiago",
  end_point: "Puerto Natales",
  method: "Plane",
  duration: 3,
  trip_id: trip1.id
)

Route.create!(
  start_point: "Puerto Natales",
  end_point: "Santiago",
  method: "Plane",
  duration: 3,
  trip_id: trip1.id
)

Route.create!(
  start_point: "Santiago",
  end_point: "Valapriso",
  method: "Plane",
  duration: 3,
  trip_id: trip1.id
)

Landmark.create!(
  title: "Concepcion neighbourhood",
  location: "Valapriso",
  description: "The best viewpoints, miradors and alleys are here and in these streets the richest cultural activities converge, surrounded by the best gastronomy. ",
  trip_id: trip1.id
)

Landmark.create!(
  title: "Winebox hotel",
  location: "Valapriso",
  description: "Cook your own private dinner on the balcony of your room and have cocktails up on the rooftop.",
  trip_id: trip1.id
)

Landmark.create!(
  title: "Funicular",
  location: "Valapriso",
  description: "Around 30 funiculars were constructed to connect the businesses of the Lower Town with the residential districts on the hills above. Take the funicular up the hills and walk down to explore different neighbourhoods.",
  trip_id: trip1.id
)

Route.create!(
  start_point: "Valapriso",
  end_point: "Pisco Elqui",
  method: "Car",
  duration: 6.5,
  trip_id: trip1.id
)

Landmark.create!(
  title: "Pisco tour at the Mistral Pisco Distillery",
  location: "Pisco Elqui",
  description: "Tour of their vineyard and how they produce Pisco, two tastings, and a monogramed Pisco glass. Enjoy drinking Pisco Sours afterwards on their large outdoor terrace and eating fresh ceviche.",
  trip_id: trip1.id
)

Route.create!(
  start_point: "Pisco Elqui",
  end_point: "Atacama Desert",
  method: "Bus",
  duration: 7,
  trip_id: trip1.id
)

Landmark.create!(
  title: "Paranal Obervatory",
  location: "Atacama Desert",
  description: " get to see the telescope and where the astronomers work, we got to see their famous residence featured in the movie James Bond Quantum Solace! Even better, the tour is free. Space is limited since they only run tours on Saturdays.",
  trip_id: trip1.id
)

Landmark.create!(
  title: "Atacama Desert Stargazing",
  location: "Atacama Desert",
  description: "The Original Stargazing Tour with the most personalized service, enjoy a unique experience in one of the cleanest and clearest skies in the world.",
  trip_id: trip1.id
)

Route.create!(
  start_point: "Atacama Desert",
  end_point: "Atacama Desert",
  method: "Flight",
  duration: 2,
  trip_id: trip1.id
)

# second trip
