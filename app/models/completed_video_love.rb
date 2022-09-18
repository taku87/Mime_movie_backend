class CompletedVideoLove < ApplicationRecord
  belongs_to :user
  belongs_to :completed_video

  validates :user_id, uniqueness: { scope: :completed_video_id }
end
