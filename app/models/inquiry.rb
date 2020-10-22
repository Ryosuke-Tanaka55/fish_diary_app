class Inquiry < ApplicationRecord

  before_save { self.email = email.downcase } # メールアドレスを保存する前に大文字を小文字に変換

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }

  validates :inquiry_title, presence: true
  validates :inquiry_detail, presence: :true

end
