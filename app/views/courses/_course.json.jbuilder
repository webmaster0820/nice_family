json.extract! course, :id, :name, :description, :price, :coach_id, :course_niveau_id, :course_place_id, :course_day_id, :created_at, :updated_at
json.url course_url(course, format: :json)
