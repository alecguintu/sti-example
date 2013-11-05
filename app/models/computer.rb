class Computer < ActiveRecord::Base
  has_many :paraphernalia, dependent: :destroy
  has_one :mouse
  has_one :keyboard

  accepts_nested_attributes_for :mouse
  accepts_nested_attributes_for :keyboard

  # TODO:
  # Trying to make this work as FormObject maybe? Technically only used when in form creation right?
  # Enable if you want to use nested_attributes
  #
  # has_one :mighty_mouse
  # accepts_nested_attributes_for :mighty_mouse
  # 
  # has_one :razer
  # accepts_nested_attributes_for :razer
end
