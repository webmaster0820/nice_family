class Child < ApplicationRecord
	belongs_to :member
	has_many :orders
	def age
		now = Time.zone.now.to_date
		now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1) if @child.present?
	end
	def order_age
		now = Time.zone.now.to_date
		now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
	end
end
