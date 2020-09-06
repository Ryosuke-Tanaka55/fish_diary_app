class User < ApplicationRecord
  has_many :diaries, dependent: :destroy

  before_save { self.email = email.downcase } # メールアドレスを保存する前に大文字を小文字に変換

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }
  VALID_TEL_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :tel, format: { with: VALID_TEL_REGEX }, allow_nil: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
