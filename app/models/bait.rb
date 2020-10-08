class Bait < ApplicationRecord
  belongs_to :user

  validates :bait_name, presence: true, uniqueness: true
end
