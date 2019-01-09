json.extract! order, :id, :first_name, :last_name, :sub_total, :token, :created_at, :updated_at
json.url order_url(order, format: :json)
