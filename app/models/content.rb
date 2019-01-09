class Content < ApplicationRecord
	enum placement: [:nav, :sub_nav, :page]
end
