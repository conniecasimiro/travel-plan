class Route < ApplicationRecord
  belongs_to :trip
  validates :start_point, :end_point, :method, :duration, presence: true
end
