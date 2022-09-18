class UserVideo < ApplicationRecord
  mount_uploader :video_url, VideoUploader
  belongs_to :user
  belongs_to :content_video
  belongs_to :completed_video

  validates :video_url, :presence => true
end
