class User < ApplicationRecord
  has_many :diaries, dependent: :destroy
  has_many :rigs, dependent: :destroy
  accepts_nested_attributes_for :rigs, allow_destroy: true
  has_many :rods, dependent: :destroy
  has_many :reels, dependent: :destroy
  has_many :lines, dependent: :destroy
  has_many :leaders, dependent: :destroy
  has_many :lures, dependent: :destroy
  has_many :colors, dependent: :destroy
  has_many :baits, dependent: :destroy
  has_many :hooks, dependent: :destroy
  has_many :genres, dependent: :destroy

  # 「remember_token」という仮想の属性を作成。
  attr_accessor :remember_token
  before_save { self.email = email.downcase } # メールアドレスを保存する前に大文字を小文字に変換

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }
  VALID_TEL_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :tel, format: { with: VALID_TEL_REGEX }, allow_nil: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # 都道府県選択
  enum prefecture: {
    北海道:1, 青森県:2, 岩手県:3, 宮城県:4, 秋田県:5, 山形県:6, 福島県:7,
    茨城県:8, 栃木県:9, 群馬県:10, 埼玉県:11, 千葉県:12, 東京都:13, 神奈川県:14,
    新潟県:15, 富山県:16, 石川県:17, 福井県:18, 山梨県:19, 長野県:20,
    岐阜県:21, 静岡県:22, 愛知県:23, 三重県:24,
    滋賀県:25, 京都府:26, 大阪府:27, 兵庫県:28, 奈良県:29, 和歌山県:30,
    鳥取県:31, 島根県:32, 岡山県:33, 広島県:34, 山口県:35,
    徳島県:36, 香川県:37, 愛媛県:38, 高知県:39,
    福岡県:40, 佐賀県:41, 長崎県:42, 熊本県:43, 大分県:44, 宮崎県:45, 鹿児島県:46, 沖縄県:47
  }

  # 渡された文字列のハッシュ値を返す。
  def User.digest(string)
    cost = 
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す。
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続セッションのためハッシュ化したトークンをデータベースに記憶。
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # トークンがダイジェストと一致すればtrueを返す。
  def authenticated?(remember_token)
    # ダイジェストが存在しない場合はfalseを返す。
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄する。
  def forget
    update_attribute(:remember_digest, nil)
  end

end
