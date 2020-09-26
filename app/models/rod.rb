class Rod < ApplicationRecord
  belongs_to :user

  validates :rod, presence: true, uniqueness: true
end
