class Form::RigCollection < Form::Base
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :rigs

  def initialize(attributes = {})
    super attributes
    self.rigs = DEFAULT_ITEM_COUNT.times.map { Rig.new() } unless self.rigs.present?
  end

  # 上でsuper attributesとしているので必要
  def rigs_attributes=(attributes)
    self.rigs = attributes.map { |_, v| Rig.new(v) }
  end

  def save
    # 複数件全て保存できた場合のみ実行したいので、transactionを使用
    Rig.transaction do
      self.rigs.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end