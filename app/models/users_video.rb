class UsersVideo < ApplicationRecord
  mount_uploader :video_url, VideoUploader
  belongs_to :user

  validates :video_url, :presence => true
end
