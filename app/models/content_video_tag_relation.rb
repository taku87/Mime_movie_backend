class ContentVideoTagRelation < ApplicationRecord
  belongs_to :content_video
  belongs_to :tag
end
