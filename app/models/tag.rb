class Tag < ApplicationRecord
  belongs_to :trip
  validates :title, presence: true
  validates :title, uniqueness: true
  # validates :id, uniqueness: { scope: :trip_id, message: "You've already added this tag" }
end
