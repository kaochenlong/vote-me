class Candidate < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 40 }

  has_many :votes
  has_many :users, through: :votes
end