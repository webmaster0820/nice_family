json.extract! email, :id, :subject, :content, :course_id, :member_id, :created_at, :updated_at
json.url email_url(email, format: :json)
