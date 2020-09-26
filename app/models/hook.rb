class Hook < ApplicationRecord
  belongs_to :user

  validastes :hook, presence: true, uniqueness: true
end
