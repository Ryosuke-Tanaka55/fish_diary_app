class Line < ApplicationRecord
  belongs_to :user

  validates :line_name, presence: true, uniqueness: true

end
