class ContentVideoComment < ApplicationRecord
  belongs_to :user
  belongs_to :content_video
end