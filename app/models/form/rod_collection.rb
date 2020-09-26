class Form::RodCollection < Form::Base
  FORM_COUNT = 5
  attr_accessor :rods

  def initialize(attributes = {})
    super attributes
    self.rods = FORM_COUNT.times.map { Rod.new() } unless self.rods.present?
  end
  
  # 上でsuper attributesとしているので必要
  def rods_attributes=(attributes)
    self.rods = attributes.map { |_, v| Rod.new(v) }
  end

  def save
    # 複数件全て保存できた場合のみ実行したいので、transactionを使用する
    Rod.transaction do
      self.rods.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end