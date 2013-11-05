class Computer < ActiveRecord::Base
  has_many :paraphernalia, dependent: :destroy
  has_one :mouse
  has_one :keyboard

  accepts_nested_attributes_for :mouse
  accepts_nested_attributes_for :keyboard

  # Should be in FormObject maybe?
  # has_one :mighty_mouse
  # accepts_nested_attributes_for :mighty_mouse
  # 
  # has_one :razer
  # accepts_nested_attributes_for :razer

  # mouse_attributes: {type: 'MightyMouse'}
  # mighty_mouse_attributes: {}
end
