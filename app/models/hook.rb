class Hook < ApplicationRecord
  belongs_to :user

  validates :hook_name, presence: true, uniqueness: true
end
