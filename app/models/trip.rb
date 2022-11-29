class Trip < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :landmarks
  has_many :routes
  has_many :tags
  has_many :comments
  validates :title, :description, :location, :duration, presence: true
end
