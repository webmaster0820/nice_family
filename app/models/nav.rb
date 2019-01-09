class Nav < ApplicationRecord
	belongs_to :page, optional: true
end
