json.extract! taged_news, :id, :tag, :status, :created_at, :updated_at
json.url taged_news_url(taged_news, format: :json)
