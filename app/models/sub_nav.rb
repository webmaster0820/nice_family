class SubNav < ApplicationRecord
	belongs_to :nav, optional: true
	belongs_to :page, optional: true
end
