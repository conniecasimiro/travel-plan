class Trip < ApplicationRecord

  # Search bar logic
  include PgSearch::Model
  pg_search_scope :global_search,
  against: [:location, :description],
  associated_against: {
    users: [:first_name, :last_name]
  },
  using: {
    tsearch: {prefix: true}
  }

  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :routes, dependent: :destroy
  has_many :landmarks, through: :routes, dependent: :destroy
  has_many :trip_tags, dependent: :destroy
  has_many :tags, through: :trip_tags
  has_many :comments, dependent: :destroy
  validates :title, :description, :location, :duration, presence: true
  validates :title, length: { maximum: 42 }
end
