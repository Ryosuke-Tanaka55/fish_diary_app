class Color < ApplicationRecord
  belongs_to :user

  validates :color, presence: true, uniqueness: true
end
