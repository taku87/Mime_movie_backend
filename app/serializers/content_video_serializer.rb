class ContentVideoSerializer
  include JSONAPI::Serializer
  attributes :id, :number, :title, :description, :thumbnail, :state, :youtube_url

  def initialize(resource, options = {})
    @@current_user = options[:current_user]
    super(resource)
  end

  attribute :comment do |content_video|
    content_video.content_video_comments.includes(:user).order(created_at: :desc)
  end

  attribute :like_amount do |content_video|
    ContentVideoLike.where(content_video_id: content_video.id).count
  end

  attribute :liked do |content_video|
    if @@current_user.nil?
      'Not Loggin'
    else
      @@current_user.like?(content_video)
    end
  end
end
