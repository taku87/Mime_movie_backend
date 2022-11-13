class ContentVideoGuestSerializer
  include JSONAPI::Serializer
  attributes :id, :number, :title, :description, :thumbnail, :state,:youtube_url

  attribute :comment do |content_video|
    content_video.content_video_comments.includes(:user).order(created_at: :desc)
  end

  attribute :like_amount do |content_video|
    ContentVideoLike.where(content_video_id: content_video.id).count
  end
end
