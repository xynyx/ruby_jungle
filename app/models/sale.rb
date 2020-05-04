class Sale < ActiveRecord::Base

  # self = class method
  # ActiveRecord Scope
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  # This also works -> Lambda
  # scope :active, -> { where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current) }

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

end
