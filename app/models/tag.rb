class Tag < ApplicationRecord
  has_many :trip_tags, dependent: :destroy
  has_many :trips, through: :trip_tags
  validates :title, presence: true
  validates :title, uniqueness: true
  # validates :id, uniqueness: { scope: :trip_id, message: "You've already added this tag" }
end
