class CoursePlace < ApplicationRecord
	has_many :courses
	belongs_to :city
end
