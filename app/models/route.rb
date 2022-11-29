class Route < ApplicationRecord
  belongs_to :trip
  validates :destination, :method, :duration, presence: true
end
