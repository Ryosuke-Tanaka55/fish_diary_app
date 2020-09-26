class Lure < ApplicationRecord
  belongs_to :user

  validates :lure, presence: true
end
