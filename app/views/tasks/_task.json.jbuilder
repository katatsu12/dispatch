json.extract! task, :id, :title, :text, :time, :created_at, :updated_at
json.url task_url(task, format: :json)
