class ContentVideoTagRelation < ApplicationRecord
  belongs_to :content_video
  belongs_to :tag

  validates :tag_id, uniqueness: { scope: :content_video_id }
end
