class ContentVideo < ApplicationRecord

  has_many :user_videos, dependent: :destroy
  has_many :completed_videos, dependent: :destroy
  has_many :content_video_tag_relations, dependent: :destroy
  has_many :tags, through: :content_video_tag_relations
  has_many :content_video_comments, dependent: :destroy
  has_many :content_video_likes, dependent: :destroy
  has_many :like_users, through: :content_video_likes, source: :user

  enum state: { draft: 0, published: 1}

end
