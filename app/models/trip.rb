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
  has_many :bookmarks
  has_many :routes
  has_many :landmarks, through: :routes
  has_many :tags
  has_many :comments
  validates :title, :description, :location, :duration, presence: true
end
