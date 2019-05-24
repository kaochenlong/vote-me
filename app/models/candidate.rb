class Candidate < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 40 }

  has_many :votes
end
