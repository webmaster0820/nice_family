class CourseCategory < ApplicationRecord
	has_many :courses
  mount_uploader :course_image, CourseImageUploader
end
