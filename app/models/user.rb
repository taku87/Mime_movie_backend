class User < ApplicationRecord
  has_many :user_videos, dependent: :destroy

  has_many :completed_video_comments, dependent: :destroy
  has_many :completed_video_likes, dependent: :destroy
  has_many :completed_video_loves, dependent: :destroy
  has_many :content_video_comments, dependent: :destroy
  has_many :content_video_likes, dependent: :destroy
  has_many :liked_content_videos, through: :content_video_likes, source: :content_video

  has_many :content_video_loves, dependent: :destroy

  validates :name, :presence => true

  def like_content_video(content_video)
    liked_content_videos << content_video
  end

  def unlike(content_video)
    liked_content_videos.delete content_video
  end

end
