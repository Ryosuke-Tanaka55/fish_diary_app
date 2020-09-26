class Bait < ApplicationRecord
  belongs_to :user

  validates :bait, presence: true, uniqueness: true
end
