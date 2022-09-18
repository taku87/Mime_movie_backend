class ContentVideo < ApplicationRecord
  mount_uploader :video_url, VideoUploader
  
  has_many :user_videos
  has_many :completed_videos
  has_many :content_video_tag_relations
  has_many :tags, through: :content_video_tag_relations, dependent: :destroy
  has_many :content_video_comments, dependent: :destroy
  has_many :content_video_likes, dependent: :destroy
  has_many :content_video_loves, dependent: :destroy

  validates :title, :video_url, :presence => true  
end
