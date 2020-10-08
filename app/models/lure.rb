class Lure < ApplicationRecord
  belongs_to :user

  validates :lure_name, presence: true, uniqueness: true
end
