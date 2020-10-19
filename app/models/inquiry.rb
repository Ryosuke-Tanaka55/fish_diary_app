class Inquiry < ApplicationRecord
  belongs_to :user

  validates :inquiry_title, presence: true
  validates :inquiry_detail, presence: :true

end
