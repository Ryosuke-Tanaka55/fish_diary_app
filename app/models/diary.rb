class Diary < ApplicationRecord
  belongs_to :user
  has_one :environment

  validates :title, length: { maximum: 100 }
  validates :fished_at, presence: true
  validates :fish_name, presence: true
  validates :size, length: { in: 1..200 }, allow_blank: true
  validates :weight, length: { in: 1..1000000 }, allow_blank: true

  # 公開範囲
  enum publish: {
    自分のみ:1, チーム内のみ:2, 公開:3
  }

end
