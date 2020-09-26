class Reel < ApplicationRecord
  belongs_to :user

  validates :reel, presence: true, uniqueness: true
end
