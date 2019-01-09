json.extract! content, :id, :title, :text, :url, :created_at, :updated_at
json.url content_url(content, format: :json)
