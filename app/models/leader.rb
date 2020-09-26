class Leader < ApplicationRecord
  belongs_to :user

  validates :leader, presence: true, uniqueness: true
end
