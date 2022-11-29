# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Trip.destroy_all
# User.destroy_all

# create_table "tags", force: :cascade do |t|
#   t.string "title"
#   t.bigint "trip_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["trip_id"], name: "index_tags_on_trip_id"
# end



# user1 = User.create!(
#   first_name: "John",
#   last_name:  "Doe",
#   email: "john@gmail.com",
#   password: "password",
#   bio: "Three years ago I quit my job and decised to backpack across the world. I wanted to visit at 100 countries before I turned 50."
# )

# Trip.create!(
#   title: "City to Valley - Exploring Chile in 2 weeks",
#   location: ""
#   description:  "Stunning diverse landscapes cover Chile all the way from the North to the South. Our 2 week Chile itinerary will take you through four regions: the wild south of Patagonia in Torres Del Paine National Park, the bohemian port city of Valparaiso, the mystical Elqui Valley where mountains are covered in cacti, and lastly to the Atacama Desert, considered one of the best places in the world for star gazing. Your 2 weeks in Chile will be filled with adventure!",
#   likes:  "Model, Actor",
#   user_id: user1.id
# )


# create_table "landmarks", force: :cascade do |t|
#   t.string "title"
#   t.string "location"
#   t.text "description"
#   t.bigint "trip_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["trip_id"], name: "index_landmarks_on_trip_id"
# end

# create_table "routes", force: :cascade do |t|
#   t.string "start_point"
#   t.string "end_point"
#   t.string "method"
#   t.integer "duration"
#   t.bigint "trip_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["trip_id"], name: "index_routes_on_trip_id"
# end
