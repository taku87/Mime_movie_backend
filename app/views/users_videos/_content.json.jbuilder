json.extract! user_video, :id, :title, :created_at, :updated_at
json.url user_video_url(user_video, format: :json)
