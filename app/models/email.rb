class Email < ApplicationRecord
	enum status: [:sendt, :deltaker, :kurs]
	belongs_to :coach
	belongs_to :course, optional: true
	belongs_to :member, optional: true
	has_many :members
end
