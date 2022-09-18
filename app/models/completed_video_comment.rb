class CompletedVideoComment < ApplicationRecord
  belongs_to :user
  belongs_to :completed_video

  validates :body, presence: true, length: { maximum: 65_535 }
end
