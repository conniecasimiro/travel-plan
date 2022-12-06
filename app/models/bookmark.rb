class Bookmark < ApplicationRecord
  after_create :increase_trip_likes
  before_destroy :decrease_trip_likes
  belongs_to :user
  belongs_to :trip
  validates :user_id, uniqueness: { scope: :trip_id, message: "You've already favourited this trip " }

  def increase_trip_likes
    trip.update(likes: trip.likes += 1)
  end

  def decrease_trip_likes
    trip.update(likes: trip.likes -= 1)
  end
end
