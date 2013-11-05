# TODO:
# Failed attempt. Would need to ask around rails for this one...

class ComputerForm
  include ActiveModel::Model

  # has_one :mighty_mouse
  # accepts_nested_attributes_for :mighty_mouse
  # 
  # has_one :razer
  # accepts_nested_attributes_for :razer

  def initialize(params)
    @computer = Computer.new(params)
  end

  def create(params)
    @computer = Computer.create(params)
  end

  def save
    @computer.save
  end
end