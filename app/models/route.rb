class Route < ApplicationRecord
  belongs_to :trip
  has_many :landmarks
  validates :destination, :method, :duration, presence: true
  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?
end
