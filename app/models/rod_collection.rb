class RodCollection
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  FORM_COUNT = 5
  attr_accessor :collection

  # 初期化メソッド
  def initialize(attributes = [])
    if attributes.present?
      self.collection = attributes.map do |value|
        Rod.new(
          rod: value['rod'],
          rod_maker: value['rod_maker']
        )
      end
    else
      self.collection = FORM_COUNT.times.map{ Rod.new }
    end
  end
  
  # レコードが存在するか確認するメソッド
  def persisted?
    false
  end

   # コレクションをDBに保存するメソッド
   def save
    is_success = true
    ActiveRecord::Base.transaction do
      collection.each do |result|
        # バリデーションを全てかけたいからsave!ではなくsaveを使用
        is_success = false unless result.save
      end
      # バリデーションエラーがあった時は例外を発生させてロールバックさせる
      raise ActiveRecord::RecordInvalid unless is_success
    end
    rescue
      p 'エラー'
    ensure
      return is_success
  end
end