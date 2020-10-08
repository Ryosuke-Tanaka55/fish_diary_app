class Rod < ApplicationRecord
  belongs_to :user

  validates :rod_name, presence: true, uniqueness: true
end
