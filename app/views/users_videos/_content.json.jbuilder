json.extract! users_video, :id, :title, :created_at, :updated_at
json.url users_video_url(users_video, format: :json)
