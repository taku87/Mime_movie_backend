class User < ApplicationRecord
  has_many :user_videos, dependent: :destroy

  has_many :completed_video_comments, dependent: :destroy
  has_many :completed_video_likes, dependent: :destroy
  has_many :completed_video_loves, dependent: :destroy
  has_many :content_video_comments, dependent: :destroy
  has_many :content_video_likes, dependent: :destroy
  has_many :content_video_loves, dependent: :destroy

  validates :name, :presence => true
end
