class Landmark < ApplicationRecord
  has_one_attached :photo
  belongs_to :trip
  validates :title, :location, :description, :photo, presence: true
  validates :title, :location, :description, :photo, uniqueness: true
end
