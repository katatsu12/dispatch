json.extract! notification, :id, :email, :created_at, :updated_at
json.url notification_url(notification, format: :json)
