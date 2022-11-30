class Route < ApplicationRecord
  belongs_to :trip
  has_many :landmarks
  validates :destination, :method, :duration, presence: true
end
