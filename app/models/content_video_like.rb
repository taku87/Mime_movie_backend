class ContentVideoLike < ApplicationRecord
  belongs_to :user
  belongs_to :content_video

  validates :user_id, uniqueness: { scope: :content_video_id }
end
