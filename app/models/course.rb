class Course < ApplicationRecord
	belongs_to :course_niveau, :optional => true
	belongs_to :course_place, optional: :true
	belongs_to :course_category, optional: :true
  enum status: [:ledig, :fullbooket]
	belongs_to :coach
  has_many :participations
	has_many :members
  has_many :emails
  mount_uploader :course_image, CourseImageUploader
  paginates_per 20

  #if participation.course_id == @course > 20

  def course_day
  	I18n.localize(day, format: '%A | %b %d').split.map(&:capitalize).join(' ')
  end

  def course_name
    unless day.past?
      if course_niveau.present?
      	I18n.localize(day, format: '%A %b %d').split.map(&:capitalize).join(' ') + (' | ') + course_category.name + (' ') + course_niveau.name + (' ') + course_place.name
      end
    end
  end

  def spots_left
    @participations = Participation.where(course_id: @course)
    limit - participations.count
  end

  #def course_category
   # unless day.past?
     # course_category.name + (' ') + course_niveau.name + (' ') + course_place.name
    #end
  #end

end
