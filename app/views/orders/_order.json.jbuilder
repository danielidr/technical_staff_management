json.extract! order, :id, :scheduled_at, :comments, :status, :client_id, :address_id, :created_at, :updated_at
json.url order_url(order, format: :json)
