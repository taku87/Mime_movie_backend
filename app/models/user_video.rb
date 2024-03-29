class UserVideo < ApplicationRecord
  belongs_to :user
  belongs_to :content_video
  belongs_to :completed_video

  validates :video_url, :presence => true
end
