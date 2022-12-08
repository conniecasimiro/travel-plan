class Landmark < ApplicationRecord
  has_one_attached :photo
  belongs_to :route
  has_one :trip, through: :route
  validates :title, :location, :description, presence: true
  validates :title, :description
  # validates :photo, attached: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
