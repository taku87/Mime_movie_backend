class Tag < ApplicationRecord
  has_many :content_video_tag_relations
  has_many :content_videos, through: :content_video_tag_relations, dependent: :destroy
end
