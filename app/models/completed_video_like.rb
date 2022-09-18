class CompletedVideoLike < ApplicationRecord
  belongs_to :user
  belongs_to :completed_video
end
