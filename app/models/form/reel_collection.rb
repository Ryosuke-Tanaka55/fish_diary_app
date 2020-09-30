class Form::ReelCollection < Form::Base
  FORM_COUNT = 5
  attr_accessor :reels

  def initialize(attributes = {})
    super attributes
    self.reels= FORM_COUNT.times.map { Reel.new() } unless self.reels.present?
  end
  
  # 上でsuper attributesとしているので必要
  def reels_attributes=(attributes)
    self.reels = attributes.map { |_, v| Reel.new(v) }
  end

  def save
    # 複数件全て保存できた場合のみ実行したいので、transactionを使用する
    Reel.transaction do
      self.reels.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end