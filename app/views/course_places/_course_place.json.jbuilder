json.extract! course_place, :id, :name, :address, :phone, :description, :created_at, :updated_at
json.url course_place_url(course_place, format: :json)
