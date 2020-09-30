class Form::LineCollection < Form::Base
  FORM_COUNT = 5
  attr_accessor :lines

  def initialize(attributes = {})
    super attributes
    self.lines = FORM_COUNT.times.map { Line.new() } unless self.lines.present?
  end
  
  # 上でsuper attributesとしているので必要
  def lines_attributes=(attributes)
    self.lines = attributes.map { |_, v| Line.new(v) }
  end

  def save
    # 複数件全て保存できた場合のみ実行したいので、transactionを使用する
    Line.transaction do
      self.lines.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end