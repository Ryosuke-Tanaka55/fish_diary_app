class Color < ApplicationRecord
  belongs_to :user

  validates :color_name, presence: true, uniqueness: true
end
