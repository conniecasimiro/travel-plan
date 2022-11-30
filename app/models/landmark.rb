class Landmark < ApplicationRecord
  has_one_attached :photo
  belongs_to :route
  has_one :trip, through: :route
  # validates :title, :location, :description, presence: true
  # validates :title, :description, uniqueness: true
  # validates :photo, attached: true
  geocoded_by :location
  after_validation :geocode
end
