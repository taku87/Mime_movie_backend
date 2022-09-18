class CompletedVideo < ApplicationRecord
  has_one :user_videos
  belongs_to :contents_video
  has_many :completed_video_comments, dependent: :destroy
  has_many :completed_video_likes, dependent: :destroy
  has_many :completed_video_loves, dependent: :destroy

end
