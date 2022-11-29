class Landmark < ApplicationRecord
  has_one_attached :photo
  belongs_to :trip
  validates :title, :location, :description, presence: true
  validates :title, :description, uniqueness: true
  validates :photo, attached: true
end
