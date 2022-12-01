class Trip < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :routes, dependent: :destroy
  has_many :landmarks, through: :routes, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title, :description, :location, :duration, presence: true
end
