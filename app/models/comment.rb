class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  validates :description, presence: true

  scope :ordered, -> { order(id: :desc) }
end
