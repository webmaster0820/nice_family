class Order < ApplicationRecord
  has_many :items, class_name: 'OrderItem'
  has_many :children
  has_one :grandparent
  has_many :participations
  accepts_nested_attributes_for :children, allow_destroy: true,
                              reject_if: ->(attrs) { attrs['first_name'].blank? }
	
	
end
