class Reel < ApplicationRecord
  belongs_to :user

  validates :reel_name, presence: true, uniqueness: true
end
