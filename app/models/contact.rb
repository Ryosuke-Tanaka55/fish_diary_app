class Contact < ApplicationRecord
  belongs_to :user

  validates :question_title, presence: true
  validates :question_detail, presence: :true

end
