json.extract! task, :id, :title, :description, :repeat, :date, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
