class Leader < ApplicationRecord
  belongs_to :user

  validates :leader_name, presence: true, uniqueness: true
end
